import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_stateful.dart';
import 'package:themovie_flutter/src/data/config/url_constant.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:themovie_flutter/src/feature/home/home_event_state.dart';
import 'package:themovie_flutter/src/feature/home/upcoming_movie/upcoming_movie_bloc.dart';
import 'package:themovie_flutter/src/navigation/route_app.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';
import 'package:themovie_flutter/src/resources/drawable.dart';
import 'package:themovie_flutter/src/widget/custom_widget/movie_image_view.dart';
import 'package:themovie_flutter/src/widget/custom_widget/movie_see_all_view.dart';
import 'package:themovie_flutter/src/widget/image/asset_image_view.dart';
import 'package:themovie_flutter/src/widget/loading/image_block_loading_view.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';
import '../../../utils/extension/context_utils.dart';

class UpcomingMovieSection extends StatefulWidget {
  final Function onUpcomingSectionError;
  const UpcomingMovieSection({
    Key? key,
    required this.onUpcomingSectionError,
  }) : super(key: key);

  @override
  _UpcomingMovieSectionState createState() => _UpcomingMovieSectionState();
}

class _UpcomingMovieSectionState extends BaseStateWidget<UpcomingMovieBloc,
    HomeState, UpcomingMovieSection> {
  @override
  Widget mapStateToWidget(HomeState state) {
    if (state is SuccessGetMovieState) {
      return createUpcomingMovies(state.movies);
    } else if (state is FailedGetMovieState) {
      widget.onUpcomingSectionError();
      return createLoading();
    } else {
      return createLoading();
    }
  }

  @override
  void setupOnInitState() {
    bloc.add(GetUpcomingMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMovieBloc, HomeState>(
      builder: (context, state) => mapStateToWidget(state),
    );
  }

  @override
  void dispose() {
    bloc.add(InitialEvent());
    super.dispose();
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
          context.navigatePushNamed(
            RouteApp.DETAIL_MOVIE_SCREEN,
            arguments: movies[position].id,
          );
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
        onTap: () {},
      );
    }
  }

  Widget createLoading() {
    return ImageBlockLoadingView();
  }
}
