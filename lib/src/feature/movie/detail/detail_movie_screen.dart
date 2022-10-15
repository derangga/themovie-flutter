import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/api_state.dart';
import '../../../core/base/base_cubit_widget.dart';
import '../../../data/config/url_constant.dart';
import '../../../data/model/cast_and_crew.dart';
import '../../../data/model/detail_movie_content.dart';
import '../../../data/model/genre.dart';
import '../../../data/model/movie.dart';
import '../../../resources/color_theme.dart';
import '../../../resources/drawable.dart';
import '../../../widget/app_scaffold.dart';
import '../../../widget/draggable_detail.dart';
import '../../../widget/image/asset_image_view.dart';
import '../../../widget/image/image_view.dart';
import '../../../widget/loading/detail_loading_view.dart';
import '../../../widget/portrait_content.dart';
import '../../../widget/text/text_view.dart';
import '../../../utils/extension/string_utils.dart';
import 'detail_movie_bloc.dart';

class DetailMovieScreen extends StatefulWidget {
  final int movieId;
  DetailMovieScreen(this.movieId);
  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends BaseCubitWidget<DetailMovieBloc,
    DetailMovieState, DetailMovieScreen> {
  late Size _size;
  Color gradientStart = Colors.transparent;
  Color gradientEnd = Colors.black;

  @override
  Widget mapStateHandler(DetailMovieState state) {
    switch (state.apiState) {
      case ApiState.SUCCESS:
        return _detailMovieView(state.content, state.isMovieFavorite);
      case ApiState.FAILED:
        return Container();
      default:
        return DetailLoadingView();
    }
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocProvider(
        create: (context) => bloc..fetchDetailMovie(widget.movieId),
        child: AppScaffold(
          body: BlocBuilder<DetailMovieBloc, DetailMovieState>(
            builder: (ctx, state) => mapStateHandler(state),
          ),
        ),
      ),
    );
  }

  Widget _detailMovieView(DetailMovieContent? content, bool isMovieFavorite) {
    final detailMovie = content?.detailMovie;
    return Stack(
      children: [
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            width: _size.width,
            height: _size.height,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [gradientStart, gradientEnd],
                ).createShader(
                  Rect.fromLTRB(0, 120, rect.width, rect.height - 20),
                );
              },
              blendMode: BlendMode.darken,
              child: CacheImageView(
                '${UrlConstant.IMAGE_URL}${detailMovie?.posterPath.orEmpty()}',
                placeholder: (context, url) =>
                    AssetImageView(path: Drawable.NO_IMAGE),
                errorPlaceholder: (context, url, error) =>
                    AssetImageView(path: Drawable.NO_IMAGE),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 12.0,
          left: 12.0,
          child: Container(
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: ColorTheme.primaryDark.withOpacity(0.65),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        DraggableDetail(
          isMovieFavorite: isMovieFavorite,
          title: detailMovie?.originalTitle,
          releaseDate: detailMovie?.releaseDate,
          voteAverage: '${detailMovie?.voteAverage}',
          genre: genreText(detailMovie?.genres ?? []),
          overview: detailMovie?.overview,
          showCast: (content?.castsMovie ?? []).isNotEmpty,
          castAndCrew: _castAndCrew(content?.castsMovie ?? []),
          showSimilarMovie: (content?.similarMovie ?? []).isNotEmpty,
          similarTitle: 'Similar Movies',
          similarMovie: _similarMovie(content?.similarMovie ?? []),
          onTrailerPressed: () {
            bloc.goToTrailerScreen(context, widget.movieId);
          },
          onFavoritePressed: () {
            bloc.addOrRemoveMovieToFavorite();
          },
        ),
      ],
    );
  }

  Widget _castAndCrew(List<Cast> castAndCrew) {
    return Container(
      width: _size.width,
      height: 260.0,
      child: ListView.separated(
        separatorBuilder: (ctx, position) => Container(
          width: 12.0,
          color: ColorTheme.primary,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: castAndCrew.length,
        itemBuilder: (ctx, position) => PortraitContent(
          imageUrl:
              '${UrlConstant.IMAGE_URL}${castAndCrew[position].profilePath}',
          margin: marginHorizontalContent(position, castAndCrew.length),
          placeholderPath: Drawable.NO_IMAGE,
          errorPlaceholderPath: Drawable.NO_IMAGE,
          content: TextView(
            '${castAndCrew[position].name}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subContent: TextView(
            '${castAndCrew[position].character}',
            textColor: Colors.grey[400],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget _similarMovie(List<Movie> movies) {
    return Container(
      width: _size.width,
      height: 260.0,
      child: ListView.separated(
        separatorBuilder: (ctx, position) => Container(
          width: 12.0,
          color: ColorTheme.primary,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (ctx, position) => PortraitContent(
          imageUrl: '${UrlConstant.IMAGE_URL}${movies[position].posterPath}',
          placeholderPath: Drawable.NO_IMAGE,
          errorPlaceholderPath: Drawable.NO_IMAGE,
          margin: marginHorizontalContent(position, movies.length),
          content: TextView(
            '${movies[position].title}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subContent: Row(
            children: [
              TextView(
                '${movies[position].voteAverage}',
                textColor: Colors.grey[400],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 8.0),
              Icon(Icons.star, color: Colors.amber)
            ],
          ),
          onTap: () {
            final movieId = movies[position].id;
            bloc.goToDetailMovieScreen(context, movieId);
          },
        ),
      ),
    );
  }

  String genreText(List<Genre> genres) {
    if (genres.isEmpty) {
      return 'Unknown';
    } else {
      return genres.first.name;
    }
  }

  EdgeInsetsGeometry? marginHorizontalContent(int position, int contentSize) {
    if (position == 0) {
      return EdgeInsets.only(left: 12.0);
    } else if (position == contentSize - 1) {
      return EdgeInsets.only(right: 12.0);
    }
    return null;
  }
}
