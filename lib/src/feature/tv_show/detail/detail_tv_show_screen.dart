import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../resources/color_theme.dart';
import '../../../resources/drawable.dart';
import '../../../widget/portrait_content.dart';
import '../../../widget/button/button_view.dart';
import '../../../widget/text/text_view.dart';
import '../../../core/base/base_stateful.dart';
import '../../../data/config/url_constant.dart';
import '../../../data/model/cast_and_crew.dart';
import '../../../data/model/detail_tv_show_content.dart';
import '../../../data/model/tv_show.dart';
import '../../../utils/extension/string_utils.dart';
import '../../../widget/detail_shimmer.dart';
import '../../../utils/date_helper.dart';
import 'detail_tv_show_bloc.dart';

class DetailTvShowScreen extends StatefulWidget {
  final int? tvShowId;
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
      return Container();
    } else
      return DetailShimmer();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ColorTheme.primaryDark,
        child: BlocBuilder<DetailTvShowBloc, DetailTvShowState>(
            builder: (ctx, state) => mapStateToWidget(state)),
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
                      Rect.fromLTRB(0, 120, rect.width, rect.height - 20));
                },
                blendMode: BlendMode.darken,
                child: Container(
                  child: FadeInImage.assetNetwork(
                      placeholder: Drawable.NO_IMAGE,
                      image:
                          '${UrlConstant.IMAGE_URL}${detailTvShow.posterPath}',
                      fit: BoxFit.cover),
                ),
              ),
            )),
        DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.2,
            maxChildSize: 0.965,
            builder: (context, scrollController) {
              return Container(
                  decoration: BoxDecoration(
                      color: ColorTheme.primaryDark.withOpacity(0.9),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.0),
                          topLeft: Radius.circular(16.0))),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 12.0),
                        height: 2.0,
                        width: 40,
                        color: Colors.grey[600],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              SizedBox(height: 16.0),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: TextView('${detailTvShow.originalName}',
                                    textSize: 24.0, textColor: Colors.white),
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: _size.width,
                                height: 16,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextView(
                                          '${detailTvShow.firstAirDate.convertDateFormat(DateHelper.FORMAT_YYYY_MM_DD, DateHelper.FORMAT_DD_MMM_COMMA_YYYY)}',
                                          textColor: Colors.grey[400],
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                      VerticalDivider(
                                        width: 20.0,
                                        color: Colors.grey,
                                        thickness: 1.5,
                                      ),
                                      TextView('${detailTvShow.voteAverage}',
                                          textColor: Colors.grey[400]),
                                      SizedBox(width: 4.0),
                                      Icon(Icons.star,
                                          color: Colors.amber, size: 16),
                                      VerticalDivider(
                                        width: 20.0,
                                        color: Colors.grey,
                                        thickness: 1.5,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: TextView(
                                          '${detailTvShow.genres.first.name}',
                                          textColor: Colors.grey[400],
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(height: 32),
                              TextView(
                                'Overview',
                                textSize: 18,
                                textColor: Colors.white,
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: TextView('${detailTvShow.overview}',
                                    textColor: Colors.grey[400],
                                    textAlign: TextAlign.center),
                              ),
                              SizedBox(height: 24.0),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ButtonView(
                                        radius: 8.0,
                                        height: 46.0,
                                        width: _size.width,
                                        text: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextView(
                                              'Trailer',
                                              textColor: Colors.white,
                                              textSize: 16.0,
                                            ),
                                            SizedBox(width: 8.0),
                                            Icon(
                                              Icons.play_circle_filled_rounded,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        color: ColorTheme.light_brown,
                                        onPressed: () {},
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      height: 46.0,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextView('Favorite',
                                                textSize: 16.0,
                                                textColor:
                                                    ColorTheme.light_brown),
                                            SizedBox(width: 8.0),
                                            Icon(
                                              Icons.favorite_border_outlined,
                                              color: ColorTheme.light_brown,
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              SizedBox(height: 32.0),
                              Container(
                                color: ColorTheme.primary,
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: TextView(
                                        'Top Series Cast',
                                        textSize: 18,
                                        textColor: Colors.white,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Container(
                                      width: _size.width,
                                      height: 260.0,
                                      child: _castAndCrew(
                                          detailTvShowContent.castsTvShow,
                                          height: 260.0,
                                          width: 140.0),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 24.0),
                              Container(
                                color: ColorTheme.primary,
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: TextView(
                                        'Similar Tv Show',
                                        textSize: 18,
                                        textColor: Colors.white,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Container(
                                      width: _size.width,
                                      height: 260.0,
                                      child: _similarTvShow(
                                          detailTvShowContent.similarTvShow,
                                          height: 260.0,
                                          width: 140.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ));
            }),
      ],
    );
  }

  Widget _castAndCrew(List<Cast> castAndCrew, {double? height, double? width}) {
    logDebug("size of cast ${castAndCrew.length}");
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
    );
  }

  Widget _similarTvShow(List<TvShow> tvShows, {double? height, double? width}) {
    return ListView.separated(
      separatorBuilder: (ctx, position) => Container(
        width: 12.0,
        color: ColorTheme.primary,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: tvShows.length,
      itemBuilder: (ctx, position) => PortraitContent(
        height: height!,
        width: width!,
        imageUrl: '${UrlConstant.IMAGE_URL}${tvShows[position].posterPath}',
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
    );
  }
}
