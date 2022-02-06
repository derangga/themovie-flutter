import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_stateful.dart';
import 'package:themovie_flutter/src/data/config/url_constant.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:themovie_flutter/src/feature/home/home_event_state.dart';
import 'package:themovie_flutter/src/feature/home/trending_movie/trending_movie_bloc.dart';
import 'package:themovie_flutter/src/navigation/route_app.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';
import 'package:themovie_flutter/src/resources/drawable.dart';
import 'package:themovie_flutter/src/widget/button/button_view.dart';
import 'package:themovie_flutter/src/widget/carousel/carousel_controller.dart';
import 'package:themovie_flutter/src/widget/carousel/carousel_options.dart';
import 'package:themovie_flutter/src/widget/carousel/carousel_slider.dart';
import 'package:themovie_flutter/src/widget/container/rounded_container_view.dart';
import 'package:themovie_flutter/src/widget/image/asset_image_view.dart';
import 'package:themovie_flutter/src/widget/image/image_view.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';
import '../../../utils/extension/context_utils.dart';

class TrendingMovieSection extends StatefulWidget {
  final Function onTrendingSectionError;
  const TrendingMovieSection({
    required this.onTrendingSectionError,
    Key? key,
  }) : super(key: key);

  @override
  _TrendingMovieSectionState createState() => _TrendingMovieSectionState();
}

class _TrendingMovieSectionState extends BaseStateWidget<TrendingMovieBloc,
    HomeState, TrendingMovieSection> {
  int _current = 0;
  final Color gradientStart = Colors.transparent;
  final Color gradientEnd = Colors.black;
  final CarouselController _controller = CarouselController();

  @override
  Widget mapStateToWidget(HomeState state) {
    if (state is SuccessGetMovieState) {
      return createCarousel(state.movies);
    } else if (state is FailedGetMovieState) {
      widget.onTrendingSectionError();
      return createLoading();
    } else {
      return createLoading();
    }
  }

  @override
  void setupOnInitState() {
    bloc.add(GetTrendingMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMovieBloc, HomeState>(
      builder: (context, state) => mapStateToWidget(state),
    );
  }

  @override
  void dispose() {
    bloc.add(InitialEvent());
    super.dispose();
  }

  Widget createCarousel(List<Movie> movies) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          options: CarouselOptions(
            height: 260.0,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          itemCount: movies.length,
          itemBuilder: (context, itemIdx, pageViewIdx) {
            return GestureDetector(
              onTap: () {
                context.navigatePushNamed(
                  RouteApp.DETAIL_MOVIE_SCREEN,
                  arguments: movies[itemIdx].id,
                );
              },
              child: imageBlock(movies[itemIdx]),
            );
          },
        ),
        Positioned(
          left: 12.0,
          bottom: 12.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: movies.asMap().entries.map((entry) {
              return GestureDetector(
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Positioned(
          right: 16.0,
          bottom: 12.0,
          child: ButtonView(
            radius: 4.0,
            height: 24,
            color: Colors.grey[200],
            text: TextView(
              'See all trending',
              textColor: Colors.black,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  Widget createLoading() {
    return RoundedContainerView(
      height: 260.0,
      margin: EdgeInsets.all(12.0),
      backgroundColor: ColorTheme.primaryDark,
      borderRadius: BorderRadius.circular(4),
    );
  }

  Widget imageBlock(Movie movie) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [gradientStart, gradientEnd],
              ).createShader(
                Rect.fromLTRB(0, 40, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.darken,
            child: CacheImageView(
              '${UrlConstant.IMAGE_URL}${movie.backdropPath}',
              fit: BoxFit.cover,
              height: 260.0,
              placeholder: (context, url) => AssetImageView(
                path: Drawable.NO_IMAGE,
                fit: BoxFit.cover,
              ),
              errorPlaceholder: (context, url, error) => AssetImageView(
                path: Drawable.NO_IMAGE,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 42.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 92.0,
                height: 140.0,
                child: CacheImageView(
                  '${UrlConstant.IMAGE_URL}${movie.posterPath}',
                  rounded: BorderRadius.circular(4.0),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => AssetImageView(
                    path: Drawable.NO_IMAGE,
                    fit: BoxFit.cover,
                  ),
                  errorPlaceholder: (context, url, error) => AssetImageView(
                    path: Drawable.NO_IMAGE,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      movie.title,
                      bold: true,
                      maxLines: 2,
                      textSize: 14,
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16.0,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 4.0),
                        TextView(
                          '${movie.voteAverage}',
                          bold: true,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
