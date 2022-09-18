import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/base_bloc_widget.dart';
import '../../../data/config/url_constant.dart';
import '../../../data/model/movie.dart';
import '../../../resources/color_theme.dart';
import '../../../resources/drawable.dart';
import '../../../utils/extension/string_utils.dart';
import '../../../widget/app_scaffold.dart';
import '../../../widget/button/button_view.dart';
import '../../../widget/container/linear_container_view.dart';
import '../../../widget/custom_widget/movie_card_view.dart';
import '../../../widget/dark_app_bar.dart';
import '../../../widget/footer_progress.dart';
import '../../../widget/loading/circular_loading_view.dart';
import '../../../widget/text/text_view.dart';
import 'upcoming_movie_bloc.dart';

class UpcomingMovieScreen extends StatefulWidget {
  const UpcomingMovieScreen({Key? key}) : super(key: key);

  @override
  _UpcomingMovieScreenState createState() => _UpcomingMovieScreenState();
}

class _UpcomingMovieScreenState extends BaseBlocWidget<UpcomingMovieBloc,
    UpcomingMovieState, UpcomingMovieScreen> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: ((context) => bloc..add(GetFirstPageMovieEvent())),
        child: AppScaffold(
          appBar: DarkAppBar(
            title: Text('Upcoming Movies'),
            leading: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: ShapeDecoration(
                  shape: CircleBorder(), color: ColorTheme.primaryDark),
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () => Navigator.pop(context)),
            ),
          ),
          body: Container(
            child: BlocBuilder<UpcomingMovieBloc, UpcomingMovieState>(
              builder: (blocContext, state) {
                return mapStateHandler(state);
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget mapStateHandler(UpcomingMovieState state) {
    if (state.status == UpcomingMovieStatus.SUCCESS ||
        state.status == UpcomingMovieStatus.LOADING) {
      return movieList(state.movies, state.hasReachedMax);
    } else if (state.status == UpcomingMovieStatus.FAILED) {
      if (state.movies.isEmpty) {
        return initialErrorView();
      } else {
        return movieList(
          state.movies,
          state.hasReachedMax,
          footerState: FooterLoadingState.ERROR,
          error: state.errorMessage.orEmpty(),
        );
      }
    } else {
      return Center(
        child: CircularLoadingView(),
      );
    }
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold &&
        !bloc.isOnLoadingOrFailed()) {
      getMovies(false);
    }
  }

  void getMovies(bool isFirstLoad) {
    if (isFirstLoad)
      bloc.add(GetFirstPageMovieEvent());
    else {
      bloc.add(GetNextPageMovieEvent());
    }
  }

  Widget initialErrorView() {
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
              bloc.add(GetFirstPageMovieEvent());
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
      controller: _scrollController,
      itemCount: hasReachBottom ? movies.length : movies.length + 1,
      itemBuilder: (ctx, position) {
        if (position >= movies.length) {
          return FooterCircularProgressIndicator(
            loadingState: footerState,
            errorText: 'Retry',
            errorColorText: Colors.white,
            buttonColor: Colors.redAccent,
            onRetryTap: () {
              getMovies(false);
            },
          );
        } else {
          return movieItem(
            movies[position],
            position,
            movies.length - 1,
          );
        }
      },
    );
  }

  Widget movieItem(Movie movie, int position, int lastPosition) {
    final topMargin = position == 0 ? 8.0 : 0.0;
    final bottomMargin = position == lastPosition ? 8.0 : 0.0;
    return MovieCardView(
      margin: EdgeInsets.fromLTRB(16.0, topMargin, 16.0, bottomMargin),
      backgroundColor: ColorTheme.primaryDark,
      imageUrl: '${UrlConstant.IMAGE_URL}${movie.posterPath}',
      title: movie.title,
      overview: movie.overview,
      movieRating: movie.voteAverage,
      dateRelease: movie.releaseDate,
      voteCount: movie.voteCount,
      placeholder: Drawable.NO_IMAGE,
      errorPlaceholder: Drawable.NO_IMAGE,
      onTap: () {
        bloc.goToDetailMovie(context, movie.id);
      },
    );
  }
}
