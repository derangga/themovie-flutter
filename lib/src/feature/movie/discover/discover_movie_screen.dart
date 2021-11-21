import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:themovie_flutter/src/navigation/route_app.dart';
import '../../../core/base/base_stateful.dart';
import '../../../data/config/url_constant.dart';
import '../../../data/model/movie.dart';
import '../../../resources/color_theme.dart';
import '../../../resources/drawable.dart';
import '../../../widget/footer_progress.dart';
import '../../../widget/text_view.dart';
import '../../../utils/extension/context_utils.dart';
import '../../../utils/extension/string_utils.dart';
import 'discover_movie_bloc.dart';

class DiscoverMovieScreen extends StatefulWidget {
  @override
  _DiscoverMovieScreenState createState() => _DiscoverMovieScreenState();
}

class _DiscoverMovieScreenState extends BaseState<DiscoverMovieBloc,
    DiscoverMovieState, DiscoverMovieScreen> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void setupOnInitState() {
    _scrollController.addListener(_onScroll);
    getMovies(true);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
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

  @override
  Widget? mapStateToWidget(DiscoverMovieState state) {
    if (state.status == DiscoverMoviesStatus.INITIAL) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: ColorTheme.light_brown,
        ),
      );
    } else if (state.status == DiscoverMoviesStatus.SUCCESS ||
        state.status == DiscoverMoviesStatus.LOADING) {
      return _movieList(state.movies, state.hasReachedMax);
    } else if (state.status == DiscoverMoviesStatus.FAILED) {
      if (state.movies.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView('${state.errorMessage.orEmpty()}',
                  textColor: Colors.white, textSize: 18.0),
              SizedBox(height: 12.0),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: TextView('Retry', textColor: Colors.white),
                  color: ColorTheme.light_brown,
                  onPressed: () {
                    bloc.add(GetFirstPageMovieEvent());
                  })
            ],
          ),
        );
      } else {
        return _movieList(
          state.movies,
          state.hasReachedMax,
          footerState: FooterLoadingState.ERROR,
          error: state.errorMessage.orEmpty(),
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Popular'),
          leading: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: ShapeDecoration(
                shape: CircleBorder(), color: ColorTheme.primary),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context)),
          ),
        ),
        body: Container(child:
            BlocBuilder<DiscoverMovieBloc, DiscoverMovieState>(
                builder: (blocContext, state) {
          return mapStateToWidget(state)!;
          // return Center(child: Text('Dummy'));
        })));
  }

  Widget _movieList(
    List<Movie> tvShows,
    bool hasReachBottom, {
    FooterLoadingState footerState = FooterLoadingState.LOADING,
    String? error,
  }) {
    return ListView.separated(
        separatorBuilder: (ctx, position) =>
            Container(height: 12.0, color: ColorTheme.primaryDark),
        controller: _scrollController,
        itemCount: hasReachBottom ? tvShows.length : tvShows.length + 1,
        itemBuilder: (ctx, position) {
          if (position >= tvShows.length) {
            return FooterCircularProgressIndicator(
              loadingState: footerState,
              errorText: 'Retry',
              errorColorText: Colors.white,
              loadingColor: ColorTheme.light_brown,
              onRetryTap: () {
                getMovies(false);
              },
            );
          } else
            return movieItem(tvShows[position]);
        });
  }

  Widget movieItem(Movie movie) {
    return InkWell(
      onTap: () {
        context.navigatePushNamed(RouteApp.DETAIL_MOVIE_SCREEN,
            arguments: movie.id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: FadeInImage.assetNetwork(
              image: '${UrlConstant.IMAGE_URL}${movie.backdropPath}',
              fit: BoxFit.cover,
              placeholder: Drawable.NO_IMAGE,
              imageErrorBuilder: _imageLoadError,
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title,
                        style: Theme.of(context).textTheme.headline2),
                    Text(
                        DateFormat("MMM dd, yyyy").format(
                            DateTime.parse(movie.releaseDate).toLocal()),
                        style: Theme.of(context).textTheme.bodyText2),
                    Text(movie.overview,
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3),
                  ])),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _imageLoadError(BuildContext ctx, Object obj, StackTrace? stackTrace) {
    return Image(image: AssetImage(Drawable.NO_IMAGE));
  }
}
