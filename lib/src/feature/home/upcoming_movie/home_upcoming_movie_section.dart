import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/api_state.dart';
import '../../../core/base/base_multi_cubit_widget.dart';
import '../../../data/remote/config/url_constant.dart';
import '../../../data/model/movie.dart';
import '../../../resources/color_theme.dart';
import '../../../resources/drawable.dart';
import '../../../widget/custom_widget/movie_image_view.dart';
import '../../../widget/custom_widget/movie_see_all_view.dart';
import '../../../widget/image/asset_image_view.dart';
import '../../../widget/loading/image_block_loading_view.dart';
import '../../../widget/text/text_view.dart';
import 'home_upcoming_movie_bloc.dart';
import 'home_upcoming_movie_state.dart';

class UpcomingMovieSection extends StatefulWidget {
  final Function onUpcomingSectionError;
  const UpcomingMovieSection({
    Key? key,
    required this.onUpcomingSectionError,
  }) : super(key: key);

  @override
  _UpcomingMovieSectionState createState() => _UpcomingMovieSectionState();
}

class _UpcomingMovieSectionState extends BaseMultiCubitWidget<
    HomeUpcomingMovieBloc, HomeUpcomingMovieState, UpcomingMovieSection> {
  @override
  Widget mapStateHandler(HomeUpcomingMovieState state) {
    switch (state.apiState) {
      case ApiState.SUCCESS:
        return createUpcomingMovies(state.movies);
      case ApiState.FAILED:
        widget.onUpcomingSectionError();
        return Container();
      default:
        return createLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc..fetchUpcomingMovie(),
      child: BlocBuilder<HomeUpcomingMovieBloc, HomeUpcomingMovieState>(
        builder: (context, state) => mapStateHandler(state),
      ),
    );
  }

  Widget createUpcomingMovies(List<Movie> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: TextView(
            'Upcoming Movies',
            bold: true,
            textSize: 20,
          ),
        ),
        SizedBox(height: 12.0),
        createImageBlock(movies),
      ],
    );
  }

  Widget createImageBlock(List<Movie> movies) {
    final itemCount = movies.length + 1;
    return Container(
      height: 184.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, position) => createImageBlockItem(
          position,
          itemCount,
          movies,
        ),
        separatorBuilder: (context, url) => SizedBox(width: 8.0),
      ),
    );
  }

  Widget createImageBlockItem(int position, int sizeList, List<Movie> movies) {
    final lastPositionMovie = sizeList - 1;
    if (position < lastPositionMovie) {
      return MovieImageView(
        imageUrl: '${UrlConstant.IMAGE_URL}${movies[position].posterPath}',
        voteAverage: movies[position].voteAverage,
        margin: position == 0 ? EdgeInsets.only(left: 16.0) : null,
        placeholder: (context, url) => AssetImageView(
          path: Drawable.NO_IMAGE,
          fit: BoxFit.cover,
        ),
        errorPlaceholder: (context, url, error) => AssetImageView(
          path: Drawable.NO_IMAGE,
          fit: BoxFit.cover,
        ),
        onTap: () {
          bloc.goToDetailMovie(context, movies[position].id);
        },
      );
    } else {
      return MovieSeeAllView(
        width: 124.0,
        height: 184.0,
        margin: EdgeInsets.only(right: 16.0),
        borderRadius: BorderRadius.circular(6.0),
        backgroundColor: ColorTheme.primaryDark,
        border: Border.all(color: ColorTheme.light_brown),
        iconData: Icons.arrow_forward_ios_outlined,
        iconSize: 14.0,
        iconColor: ColorTheme.light_brown,
        textSize: 14.0,
        textColor: ColorTheme.light_brown,
        onTap: () {
          bloc.goToUpcomingMovie(context);
        },
      );
    }
  }

  Widget createLoading() {
    return ImageBlockLoadingView();
  }
}
