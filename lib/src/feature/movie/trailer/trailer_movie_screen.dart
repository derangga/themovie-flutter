import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/feature/movie/trailer/trailer_movie_bloc.dart';
import 'package:themovie_flutter/src/navigation/route_app.dart';
import 'package:themovie_flutter/src/navigation/screen_args/video_player_arguments.dart';

import '../../../core/base/base_stateful.dart';
import '../../../data/config/url_constant.dart';
import '../../../data/model/videos.dart';
import '../../../resources/color_theme.dart';
import '../../../resources/drawable.dart';
import '../../../widget/app_scaffold.dart';
import '../../../widget/button/button_view.dart';
import '../../../widget/container/linear_container_view.dart';
import '../../../widget/custom_widget/movie_trailer_view.dart';
import '../../../widget/dark_app_bar.dart';
import '../../../widget/image/asset_image_view.dart';
import '../../../widget/loading/circular_loading_view.dart';
import '../../../widget/text/text_view.dart';
import '../../../utils/extension/context_utils.dart';

class TrailerMovieScreen extends StatefulWidget {
  final int tvShowId;
  TrailerMovieScreen(this.tvShowId);
  @override
  _TrailerMovieScreenState createState() => _TrailerMovieScreenState();
}

class _TrailerMovieScreenState extends BaseStateWidget<TrailerMovieBloc,
    TrailerMovieState, TrailerMovieScreen> {
  @override
  void setupOnInitState() {
    bloc.add(GetTrailerMovieEvent(widget.tvShowId));
  }

  @override
  Widget mapStateToWidget(TrailerMovieState state) {
    if (state is SuccessGetTrailerMovieState) {
      return trailerList(state.videos);
    } else if (state is ErrorGetTrailerMovieState) {
      return errorView();
    }
    return loading();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: DarkAppBar(
        title: Text('Video'),
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: ShapeDecoration(
              shape: CircleBorder(), color: ColorTheme.primaryDark),
          child: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context)),
        ),
      ),
      body: BlocBuilder<TrailerMovieBloc, TrailerMovieState>(
        builder: (context, state) => mapStateToWidget(state),
      ),
    );
  }

  Widget loading() {
    return Center(
      child: CircularLoadingView(),
    );
  }

  Widget trailerList(List<Video> videos) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.separated(
        itemBuilder: ((context, position) {
          final video = videos[position];
          final thumbnail = UrlConstant.youtubeThumbnail(video.key);
          return MovieTrailerView(
            imageUrl: thumbnail,
            title: video.name,
            subtitle: video.type,
            showSubtitle: video.type.isNotEmpty,
            placeholder: (context, url) => AssetImageView(
              path: Drawable.NO_IMAGE,
            ),
            errorPlaceholder: (context, url, error) => AssetImageView(
              path: Drawable.NO_IMAGE,
            ),
            margin: marginVertical(position, videos.length),
            onTap: () {
              onTrailerClicked(video);
            },
          );
        }),
        separatorBuilder: (context, position) => SizedBox(
          height: 8.0,
        ),
        itemCount: videos.length,
      ),
    );
  }

  void onTrailerClicked(Video video) {
    final params = VideoPlayerArguments(video.id, video.key);
    context.navigatePushNamed(
      RouteApp.VIDEO_PLAYER_SCREEN,
      arguments: params,
    );
  }

  EdgeInsetsGeometry? marginVertical(int position, int length) {
    if (position == 0) {
      return EdgeInsets.only(top: 8.0);
    } else if (position == length - 1) {
      return EdgeInsets.only(bottom: 8.0);
    }
    return null;
  }

  Widget errorView() {
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
              bloc.add(GetTrailerMovieEvent(widget.tvShowId));
            },
          ),
        ],
      ),
    );
  }
}
