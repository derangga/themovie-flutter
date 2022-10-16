import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_bloc_widget.dart';
import 'package:themovie_flutter/src/feature/search/search_bloc.dart';
import 'package:themovie_flutter/src/widget/app_scaffold.dart';
import 'package:themovie_flutter/src/widget/container/rounded_container_view.dart';
import 'package:themovie_flutter/src/widget/dark_app_bar.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';

import '../../data/model/movie.dart';
import '../../data/model/tv_show.dart';
import '../../data/remote/config/url_constant.dart';
import '../../resources/color_theme.dart';
import '../../resources/drawable.dart';
import '../../utils/date_helper.dart';
import '../../widget/button/button_view.dart';
import '../../widget/container/linear_container_view.dart';
import '../../widget/custom_widget/movie_card_view.dart';
import '../../widget/footer_progress.dart';
import '../../widget/loading/circular_loading_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState
    extends BaseBlocWidget<SearchBloc, SearchState, SearchScreen> {
  final _movieScrollController = ScrollController();
  final _tvShowScrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _movieScrollController.addListener(_onMovieScroll);
    _tvShowScrollController.addListener(_onTvShowScroll);
  }

  @override
  void dispose() {
    _movieScrollController.removeListener(_onMovieScroll);
    _tvShowScrollController.removeListener(_onTvShowScroll);
    super.dispose();
  }

  void _onMovieScroll() {
    final maxScroll = _movieScrollController.position.maxScrollExtent;
    final currentScroll = _movieScrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold &&
        !bloc.isOnLoadingOrFailed()) {
      _fetchSearch(false);
    }
  }

  void _onTvShowScroll() {
    final maxScroll = _tvShowScrollController.position.maxScrollExtent;
    final currentScroll = _tvShowScrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold &&
        !bloc.isOnLoadingOrFailed()) {
      _fetchSearch(false);
    }
  }

  void _fetchSearch(bool isFirstLoad) {
    if (isFirstLoad) {
      switch (bloc.state.searchType) {
        case SearchType.MOVIE:
          bloc.add(FetchSearchMovieEvent(false));
          break;
        case SearchType.TVSHOW:
          bloc.add(FetchSearchTvShowEvent(false));
          break;
      }
    } else {
      switch (bloc.state.searchType) {
        case SearchType.MOVIE:
          bloc.add(FetchSearchMovieEvent(true));
          break;
        case SearchType.TVSHOW:
          bloc.add(FetchSearchTvShowEvent(true));
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => bloc),
      child: AppScaffold(
        appBar: DarkAppBar(
          title: searchBar(),
          actions: [
            IconButton(
              onPressed: () {
                bloc.add(ShowSearchFilterEvent());
              },
              tooltip: 'Search Filter',
              icon: Icon(
                Icons.tune,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: BlocListener<SearchBloc, SearchState>(
          listener: ((context, state) => mapStateBlocListener(state)),
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: ((context, state) => mapStateHandler(state)),
          ),
        ),
      ),
    );
  }

  void mapStateBlocListener(SearchState state) {
    if (state.searchQuery.isNotEmpty && state.status == SearchStatus.INITIAL) {
      switch (state.searchType) {
        case SearchType.MOVIE:
          bloc.add(FetchSearchMovieEvent(false));
          break;
        case SearchType.TVSHOW:
          bloc.add(FetchSearchTvShowEvent(false));
          break;
      }
    } else if (state.showBotomSheet) {
      showBottomSheet(state.searchType);
    }
  }

  @override
  Widget mapStateHandler(SearchState state) {
    if (state.status == SearchStatus.SUCCESS ||
        state.status == SearchStatus.LOADING_FOOTER) {
      switch (state.searchType) {
        case SearchType.TVSHOW:
          return tvShowList(state.tvShows, state.hasReachedMax);
        default:
          return movieList(state.movies, state.hasReachedMax);
      }
    } else if (state.status == SearchStatus.FAILED) {
      switch (state.searchType) {
        case SearchType.TVSHOW:
          if (state.tvShows.isEmpty) {
            return initialErrorView(state);
          } else {
            return tvShowList(
              state.tvShows,
              state.hasReachedMax,
              footerState: FooterLoadingState.ERROR,
              error: state.errorMessage ?? '',
            );
          }
        default:
          if (state.movies.isEmpty) {
            return initialErrorView(state);
          } else {
            return movieList(
              state.movies,
              state.hasReachedMax,
              footerState: FooterLoadingState.ERROR,
              error: state.errorMessage ?? '',
            );
          }
      }
    } else if (state.status == SearchStatus.LOADING) {
      return Center(
        child: CircularLoadingView(),
      );
    }

    return Container();
  }

  Widget searchBar() {
    return GestureDetector(
      child: RoundedContainerView(
        height: 36.0,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
        padding: EdgeInsets.all(6.0),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.white,
              size: 16,
            ),
            SizedBox(width: 12.0),
            BlocBuilder<SearchBloc, SearchState>(
              builder: ((context, state) {
                String text = 'Find your favorite movie';
                if (state.searchQuery.isNotEmpty) {
                  text = state.searchQuery;
                }
                return TextView(
                  text,
                  textColor: Colors.grey,
                );
              }),
            ),
          ],
        ),
      ),
      onTap: () {
        bloc.add(GoToSuggestionEvent(context));
      },
    );
  }

  Widget initialErrorView(SearchState state) {
    return Center(
      child: LinearContainerView(
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextView(
            'There is something wrong with your request',
            textColor: Colors.white,
            textSize: 16.0,
            bold: true,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.0),
          ButtonView(
            text: TextView(
              'Retry',
              textColor: Colors.white,
              textSize: 14.0,
            ),
            color: Colors.redAccent,
            onPressed: () {
              switch (state.searchType) {
                case SearchType.MOVIE:
                  bloc.add(FetchSearchMovieEvent(false));
                  break;
                case SearchType.TVSHOW:
                  bloc.add(FetchSearchTvShowEvent(false));
                  break;
              }
            },
          ),
        ],
      ),
    );
  }

  Widget movieList(
    List<Movie> movies,
    bool hasReachBottom, {
    FooterLoadingState footerState = FooterLoadingState.LOADING,
    String? error,
  }) {
    return ListView.separated(
      separatorBuilder: (ctx, position) => SizedBox(height: 8.0),
      controller: _movieScrollController,
      itemCount: hasReachBottom ? movies.length : movies.length + 1,
      itemBuilder: (ctx, position) {
        if (position >= movies.length) {
          return FooterCircularProgressIndicator(
            loadingState: footerState,
            errorText: 'Retry',
            errorColorText: Colors.white,
            buttonColor: Colors.redAccent,
            onRetryTap: () {
              _fetchSearch(false);
            },
          );
        } else {
          return movieItem(
            position,
            movies[position],
            movies.length - 1,
          );
        }
      },
    );
  }

  Widget movieItem(
    int position,
    Movie movie,
    int lastPosition,
  ) {
    final topMargin = position == 0 ? 8.0 : 0.0;
    final bottomMargin = position == lastPosition ? 8.0 : 0.0;
    return MovieCardView(
      margin: EdgeInsets.fromLTRB(16.0, topMargin, 16.0, bottomMargin),
      backgroundColor: ColorTheme.primaryDark,
      imageUrl: '${UrlConstant.IMAGE_URL}${movie.posterPath}',
      title: movie.title,
      overview: movie.overview,
      movieRating: movie.voteAverage,
      dateRelease: DateHelper.formatConverter(
        movie.releaseDate,
        DateHelper.FORMAT_YYYY_MM_DD,
        DateHelper.FORMAT_DD_MMM_COMMA_YYYY,
      ),
      voteCount: movie.voteCount,
      placeholder: Drawable.NO_IMAGE,
      errorPlaceholder: Drawable.NO_IMAGE,
      onTap: () {
        bloc.goToDetailMovie(context, movie.id);
      },
    );
  }

  Widget tvShowList(
    List<TvShow> tvShows,
    bool hasReachBottom, {
    FooterLoadingState footerState = FooterLoadingState.LOADING,
    String? error,
  }) {
    return ListView.separated(
      separatorBuilder: (ctx, position) => SizedBox(height: 8.0),
      controller: _tvShowScrollController,
      itemCount: hasReachBottom ? tvShows.length : tvShows.length + 1,
      itemBuilder: (ctx, position) {
        if (position >= tvShows.length) {
          return FooterCircularProgressIndicator(
            loadingState: footerState,
            errorText: 'Retry',
            errorColorText: Colors.white,
            buttonColor: Colors.redAccent,
            onRetryTap: () {
              _fetchSearch(false);
            },
          );
        } else {
          return tvShowItem(
            position,
            tvShows[position],
            tvShows.length - 1,
          );
        }
      },
    );
  }

  Widget tvShowItem(
    int position,
    TvShow tvShow,
    int lastPosition,
  ) {
    final topMargin = position == 0 ? 8.0 : 0.0;
    final bottomMargin = position == lastPosition ? 8.0 : 0.0;
    return MovieCardView(
      margin: EdgeInsets.fromLTRB(16.0, topMargin, 16.0, bottomMargin),
      backgroundColor: ColorTheme.primaryDark,
      imageUrl: '${UrlConstant.IMAGE_URL}${tvShow.posterPath}',
      title: tvShow.originalName,
      overview: tvShow.overview,
      movieRating: tvShow.voteAverage,
      dateRelease: DateHelper.formatConverter(
        tvShow.firstAirDate,
        DateHelper.FORMAT_YYYY_MM_DD,
        DateHelper.FORMAT_DD_MMM_COMMA_YYYY,
      ),
      voteCount: tvShow.voteCount,
      placeholder: Drawable.NO_IMAGE,
      errorPlaceholder: Drawable.NO_IMAGE,
      onTap: () {
        bloc.goToDetailTvShow(context, tvShow.id);
      },
    );
  }

  void showBottomSheet(SearchType type) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorTheme.primaryDark,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Movies'),
                trailing: Radio<SearchType>(
                  value: SearchType.MOVIE,
                  activeColor: Colors.white,
                  groupValue: type,
                  onChanged: (SearchType? value) {
                    Navigator.pop(context);
                    bloc.add(FetchSearchMovieEvent(false));
                  },
                ),
              ),
              ListTile(
                title: const Text('Tv Shows'),
                trailing: Radio<SearchType>(
                  value: SearchType.TVSHOW,
                  activeColor: Colors.white,
                  groupValue: type,
                  onChanged: (SearchType? value) {
                    Navigator.pop(context);
                    bloc.add(FetchSearchTvShowEvent(false));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
