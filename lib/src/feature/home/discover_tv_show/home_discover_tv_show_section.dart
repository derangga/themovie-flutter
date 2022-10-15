import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/api_state.dart';
import '../../../core/base/base_multi_cubit_widget.dart';
import '../../../data/remote/config/url_constant.dart';
import '../../../data/model/tv_show.dart';
import '../../../resources/color_theme.dart';
import '../../../resources/drawable.dart';
import '../../../widget/custom_widget/movie_image_view.dart';
import '../../../widget/custom_widget/movie_see_all_view.dart';
import '../../../widget/image/asset_image_view.dart';
import '../../../widget/loading/image_block_loading_view.dart';
import '../../../widget/text/text_view.dart';
import 'home_discover_tv_show_bloc.dart';
import 'home_discover_tv_show_state.dart';

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

class _HomeDiscoverTvShowSectionState extends BaseMultiCubitWidget<
    HomeDiscoverTvShowBloc,
    HomeDiscoverTvShowState,
    HomeDiscoverTvShowSection> {
  @override
  Widget mapStateHandler(HomeDiscoverTvShowState state) {
    switch (state.apiState) {
      case ApiState.SUCCESS:
        return createDiscoverTvShow(state.tvShows);
      case ApiState.FAILED:
        widget.onDiscoverTvShowSectionError();
        return Container();
      default:
        return createLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc..fetchDiscoverTvShow(),
      child: BlocBuilder<HomeDiscoverTvShowBloc, HomeDiscoverTvShowState>(
        builder: (context, state) => mapStateHandler(state),
      ),
    );
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
          bloc.goToDetailTvShow(context, tvShows[position].id);
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
          bloc.goToDiscoverTvShow(context);
        },
      );
    }
  }

  Widget createLoading() {
    return ImageBlockLoadingView();
  }
}
