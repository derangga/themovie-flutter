import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_stateful.dart';
import 'package:themovie_flutter/src/data/config/url_constant.dart';
import 'package:themovie_flutter/src/data/model/cast_and_crew.dart';
import 'package:themovie_flutter/src/data/model/detail_movie_content.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';
import 'package:themovie_flutter/src/resources/drawable.dart';
import 'package:themovie_flutter/src/utils/date_helper.dart';
import 'package:themovie_flutter/src/widget/detail_shimmer.dart';
import 'package:themovie_flutter/src/widget/draggable_detail.dart';
import 'package:themovie_flutter/src/widget/portrait_content.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';
import '../../../utils/extension/string_utils.dart';
import 'detail_movie_bloc.dart';

class DetailMovieScreen extends StatefulWidget {
  final int? movieId;
  DetailMovieScreen(this.movieId);
  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState
    extends BaseState<DetailMovieBloc, DetailMovieState, DetailMovieScreen> {
  late Size _size;
  Color gradientStart = Colors.transparent;
  Color gradientEnd = Colors.black;

  @override
  Widget mapStateToWidget(DetailMovieState state) {
    if (state is SuccessGetDetailMovie) {
      return _detailMovieView(state.content);
    } else if (state is ErrorGetDetailMovie) {
      return Container();
    } else {
      return DetailShimmer();
    }
  }

  @override
  void setupOnInitState() {
    bloc.add(GetDetailMovieEvent(widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: ColorTheme.primaryDark,
          child: BlocBuilder<DetailMovieBloc, DetailMovieState>(
              builder: (ctx, state) => mapStateToWidget(state)),
        ),
      ),
    );
  }

  Widget _detailMovieView(DetailMovieContent content) {
    final detailMovie = content.detailMovie;
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
                      Rect.fromLTRB(0, 120, rect.width, rect.height - 20));
                },
                blendMode: BlendMode.darken,
                child: Container(
                  child: FadeInImage.assetNetwork(
                      placeholder: Drawable.NO_IMAGE,
                      image:
                          '${UrlConstant.IMAGE_URL}${detailMovie.posterPath}',
                      fit: BoxFit.cover),
                ),
              ),
            )),
        DraggableDetail(
          title: detailMovie.originalTitle,
          releaseDate: detailMovie.releaseDate!.convertDateFormat(
            DateHelper.FORMAT_YYYY_MM_DD,
            DateHelper.FORMAT_DD_MMM_COMMA_YYYY,
          ),
          voteAverage: '${detailMovie.voteAverage}',
          genre: '${detailMovie.genres!.first.name}',
          overview: detailMovie.overview,
          castAndCrew: Container(
            width: _size.width,
            height: 260.0,
            child: _castAndCrew(
              content.castsMovie,
              height: 260.0,
              width: 140.0,
            ),
          ),
          similarTitle: 'Similar Movies',
          similarMovie: Container(
            width: _size.width,
            height: 260.0,
            child: _similarMovie(
              content.similarMOvie,
              height: 260.0,
              width: 140.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _castAndCrew(List<Cast> castAndCrew, {double? height, double? width}) {
    return ListView.separated(
      separatorBuilder: (ctx, position) => Container(
        width: 12.0,
        color: ColorTheme.primary,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: castAndCrew.length,
      itemBuilder: (ctx, position) => PortraitContent(
        height: height!,
        width: width!,
        imageUrl:
            '${UrlConstant.IMAGE_URL}${castAndCrew[position].profilePath}',
        margin: position == 0 ? EdgeInsets.only(left: 12.0) : null,
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
    );
  }

  Widget _similarMovie(List<Movie> movies, {double? height, double? width}) {
    return ListView.separated(
      separatorBuilder: (ctx, position) => Container(
        width: 12.0,
        color: ColorTheme.primary,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (ctx, position) => PortraitContent(
        height: height!,
        width: width!,
        imageUrl: '${UrlConstant.IMAGE_URL}${movies[position].posterPath}',
        margin: position == 0 ? EdgeInsets.only(left: 12.0) : null,
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
      ),
    );
  }
}
