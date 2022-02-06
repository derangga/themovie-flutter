import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_stateful.dart';
import 'package:themovie_flutter/src/data/config/url_constant.dart';
import 'package:themovie_flutter/src/data/model/tv_show.dart';
import 'package:themovie_flutter/src/feature/home/discover_tv_show/home_discover_tv_show_bloc.dart';
import 'package:themovie_flutter/src/feature/home/home_event_state.dart';
import 'package:themovie_flutter/src/navigation/route_app.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';
import 'package:themovie_flutter/src/resources/drawable.dart';
import 'package:themovie_flutter/src/widget/custom_widget/movie_image_view.dart';
import 'package:themovie_flutter/src/widget/custom_widget/movie_see_all_view.dart';
import 'package:themovie_flutter/src/widget/image/asset_image_view.dart';
import 'package:themovie_flutter/src/widget/loading/image_block_loading_view.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';
import '../../../utils/extension/context_utils.dart';

class HomeDiscoverTvShowSection extends StatefulWidget {
  final Function onDiscoverTvShowSectionError;
  const HomeDiscoverTvShowSection({
    Key? key,
    required this.onDiscoverTvShowSectionError,
  }) : super(key: key);

  @override
  _HomeDiscoverTvShowSectionState createState() =>
      _HomeDiscoverTvShowSectionState();
}

class _HomeDiscoverTvShowSectionState extends BaseStateWidget<
    HomeDiscoverTvShowBloc, HomeState, HomeDiscoverTvShowSection> {
  @override
  Widget mapStateToWidget(HomeState state) {
    if (state is SuccessGetTvShowState) {
      return createDiscoverTvShow(state.tvShows);
    } else if (state is FailedGetTvShowState) {
      widget.onDiscoverTvShowSectionError();
      return createLoading();
    } else {
      return createLoading();
    }
  }

  @override
  void setupOnInitState() {
    bloc.add(GetDiscoverTvShowEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeDiscoverTvShowBloc, HomeState>(
      builder: (context, state) => mapStateToWidget(state),
    );
  }

  @override
  void dispose() {
    bloc.add(InitialEvent());
    super.dispose();
  }

  Widget createDiscoverTvShow(List<TvShow> tvShows) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: TextView(
            'Tv Shows',
            bold: true,
            textSize: 20,
          ),
        ),
        SizedBox(height: 12.0),
        createImageBlock(tvShows),
      ],
    );
  }

  Widget createImageBlock(List<TvShow> movies) {
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

  Widget createImageBlockItem(
      int position, int sizeList, List<TvShow> tvShows) {
    final lastPositionMovie = sizeList - 1;
    if (position < lastPositionMovie) {
      return MovieImageView(
        imageUrl: '${UrlConstant.IMAGE_URL}${tvShows[position].posterPath}',
        voteAverage: tvShows[position].voteAverage,
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
            RouteApp.DETAIL_TV_SCREEN,
            arguments: tvShows[position].id,
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
        onTap: () {
          context.navigatePushNamed(RouteApp.DISCOVER_TV_SCREEN);
        },
      );
    }
  }

  Widget createLoading() {
    return ImageBlockLoadingView();
  }
}
