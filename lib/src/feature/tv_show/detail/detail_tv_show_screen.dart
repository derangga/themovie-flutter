import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/widget/app_scaffold.dart';
import 'package:themovie_flutter/src/widget/button/button_view.dart';
import 'package:themovie_flutter/src/widget/container/linear_container_view.dart';
import 'package:themovie_flutter/src/widget/draggable_detail.dart';
import 'package:themovie_flutter/src/widget/image/asset_image_view.dart';
import 'package:themovie_flutter/src/widget/image/image_view.dart';
import 'package:themovie_flutter/src/widget/loading/detail_loading_view.dart';
import '../../../resources/color_theme.dart';
import '../../../resources/drawable.dart';
import '../../../widget/portrait_content.dart';
import '../../../widget/text/text_view.dart';
import '../../../core/base/base_stateful.dart';
import '../../../data/config/url_constant.dart';
import '../../../data/model/cast_and_crew.dart';
import '../../../data/model/detail_tv_show_content.dart';
import '../../../data/model/tv_show.dart';
import 'detail_tv_show_bloc.dart';

class DetailTvShowScreen extends StatefulWidget {
  final int tvShowId;
  DetailTvShowScreen(this.tvShowId);
  @override
  _DetailTvShowScreenState createState() => _DetailTvShowScreenState();
}

class _DetailTvShowScreenState
    extends BaseState<DetailTvShowBloc, DetailTvShowState, DetailTvShowScreen> {
  late Size _size;
  Color gradientStart = Colors.transparent;
  Color gradientEnd = Colors.black;

  @override
  void setupOnInitState() {
    bloc.add(GetDetailTvShowEvent(widget.tvShowId));
  }

  @override
  Widget mapStateToWidget(DetailTvShowState state) {
    if (state is SuccessGetDetailTvShowState) {
      return _detailTvView(state.detailTvShowContent);
    } else if (state is ErrorGetDetailTvShowState) {
      return errorView();
    } else {
      return DetailLoadingView();
    }
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SafeArea(
      child: AppScaffold(
        body: BlocBuilder<DetailTvShowBloc, DetailTvShowState>(
          builder: (ctx, state) => mapStateToWidget(state),
        ),
      ),
    );
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
              bloc.add(GetDetailTvShowEvent(widget.tvShowId));
            },
          ),
        ],
      ),
    );
  }

  Widget _detailTvView(DetailTvShowContent detailTvShowContent) {
    final detailTvShow = detailTvShowContent.detailTvShow;
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
                '${UrlConstant.IMAGE_URL}${detailTvShow.posterPath}',
                placeholder: (context, url) =>
                    AssetImageView(path: Drawable.NO_IMAGE),
                errorPlaceholder: (context, url, error) =>
                    AssetImageView(path: Drawable.DUMMY_IMAGE),
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
          title: detailTvShow.originalName,
          releaseDate: detailTvShow.firstAirDate,
          voteAverage: '${detailTvShow.voteAverage}',
          genre: '${detailTvShow.genres.first.name}',
          overview: detailTvShow.overview,
          castAndCrew: _castAndCrew(detailTvShowContent.castsTvShow),
          similarTitle: 'Similar Tv Show',
          similarMovie: _similarTvShow(detailTvShowContent.similarTvShow),
        )
      ],
    );
  }

  Widget _castAndCrew(List<Cast> castAndCrew) {
    if (castAndCrew.isEmpty) return Container();

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
          placeholderPath: Drawable.NO_IMAGE,
          errorPlaceholderPath: Drawable.NO_IMAGE,
          margin: position == 0 ? EdgeInsets.only(left: 12.0) : null,
          content: TextView(
            '${castAndCrew[position].name}',
            textColor: Colors.white,
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

  Widget _similarTvShow(List<TvShow> tvShows) {
    if (tvShows.isEmpty) return Container();

    return Container(
      width: _size.width,
      height: 260.0,
      child: ListView.separated(
        separatorBuilder: (ctx, position) => Container(
          width: 12.0,
          color: ColorTheme.primary,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: tvShows.length,
        itemBuilder: (ctx, position) => PortraitContent(
          imageUrl: '${UrlConstant.IMAGE_URL}${tvShows[position].posterPath}',
          placeholderPath: Drawable.NO_IMAGE,
          errorPlaceholderPath: Drawable.NO_IMAGE,
          margin: position == 0 ? EdgeInsets.only(left: 12.0) : null,
          content: TextView(
            '${tvShows[position].originalName}',
            textColor: Colors.white,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subContent: Row(
            children: [
              TextView(
                '${tvShows[position].voteAverage}',
                textColor: Colors.grey[400],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 8.0),
              Icon(Icons.star, color: Colors.amber)
            ],
          ),
        ),
      ),
    );
  }
}
