import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';
import 'package:themovie_flutter/src/widget/container/linear_container_view.dart';

import 'button/button_view.dart';
import 'text/text_view.dart';

class DraggableDetail extends StatelessWidget {
  final String? title, releaseDate, voteAverage, genre, overview, similarTitle;
  final Widget castAndCrew, similarMovie;
  final bool showCast, showSimilarMovie, isMovieFavorite;
  final VoidCallback? onTrailerPressed;
  final GestureTapCallback? onFavoritePressed;

  DraggableDetail({
    this.title,
    this.releaseDate,
    this.voteAverage,
    this.genre,
    this.overview,
    this.similarTitle,
    this.showCast = false,
    this.showSimilarMovie = false,
    required this.castAndCrew,
    required this.similarMovie,
    required this.isMovieFavorite,
    this.onTrailerPressed,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.2,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: ColorTheme.primaryDark.withOpacity(0.9),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.0),
              topLeft: Radius.circular(16.0),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 12.0),
                height: 2.0,
                width: 40,
                color: Colors.grey[600],
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    SizedBox(height: 16.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextView(
                        title,
                        textSize: 24.0,
                        textColor: Colors.white,
                        maxLines: 5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 16),
                    subHeaderSection(size),
                    SizedBox(height: 32),
                    TextView(
                      'Overview',
                      textSize: 18,
                      textColor: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextView(
                        overview,
                        textColor: Colors.grey[400],
                        maxLines: 50,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    trailerAndFavoriteSection(size),
                    castAndCrewSection(),
                    similarSection(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget subHeaderSection(Size size) {
    return Container(
      width: size.width,
      height: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: TextView(
              releaseDate,
              textColor: Colors.grey[400],
              textAlign: TextAlign.end,
            ),
          ),
          VerticalDivider(
            width: 20.0,
            color: Colors.grey,
            thickness: 1.5,
          ),
          TextView(
            voteAverage,
            textColor: Colors.grey[400],
          ),
          SizedBox(width: 4.0),
          Icon(Icons.star, color: Colors.amber, size: 16),
          VerticalDivider(
            width: 20.0,
            color: Colors.grey,
            thickness: 1.5,
          ),
          Expanded(
            flex: 1,
            child: TextView(
              genre,
              textColor: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget trailerAndFavoriteSection(Size size) {
    return LinearContainerView(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      orientation: LinearContainerOrientation.HORIZONTAL,
      children: [
        Expanded(
          child: ButtonView(
            radius: 8.0,
            height: 46.0,
            width: size.width,
            text: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
            onPressed: onTrailerPressed,
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: InkWell(
            child: Container(
              height: 46.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(
                    'Favorite',
                    textSize: 16.0,
                    textColor: ColorTheme.light_brown,
                  ),
                  SizedBox(width: 8.0),
                  favoriteIcon()
                ],
              ),
            ),
            onTap: onFavoritePressed,
          ),
        )
      ],
    );
  }

  Widget castAndCrewSection() {
    if (showCast) {
      return LinearContainerView(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        crossAxisAlignment: CrossAxisAlignment.start,
        background: ColorTheme.primary,
        margin: EdgeInsets.only(top: 24.0),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextView(
              'Top Series Cast',
              textSize: 18,
              textColor: Colors.white,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 20.0),
          castAndCrew
        ],
      );
    } else {
      return Container();
    }
  }

  Widget similarSection() {
    if (showSimilarMovie) {
      return LinearContainerView(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        background: ColorTheme.primary,
        crossAxisAlignment: CrossAxisAlignment.start,
        margin: EdgeInsets.only(top: 24.0),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextView(
              similarTitle,
              textSize: 18,
              textColor: Colors.white,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 20.0),
          similarMovie
        ],
      );
    } else {
      return Container();
    }
  }

  Widget favoriteIcon() {
    if (isMovieFavorite) {
      return Icon(
        Icons.favorite_rounded,
        color: ColorTheme.light_brown,
      );
    } else {
      return Icon(
        Icons.favorite_border_outlined,
        color: ColorTheme.light_brown,
      );
    }
  }
}
