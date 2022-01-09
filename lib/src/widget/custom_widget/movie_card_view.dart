import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/widget/container/linear_container_view.dart';
import 'package:themovie_flutter/src/widget/container/rounded_container_view.dart';
import 'package:themovie_flutter/src/widget/image/asset_image_view.dart';
import 'package:themovie_flutter/src/widget/image/image_view.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';
import '../../utils/extension/string_utils.dart';

class MovieCardView extends StatelessWidget {
  final String imageUrl;
  final String? placeholder;
  final String? errorPlaceholder;
  final GestureTapCallback? onTap;
  final String title;
  final String overview;
  final String movieRating;
  final int voteCount;
  final String dateRelease;
  final Color? backgroundColor;
  final BoxBorder? border;
  final EdgeInsetsGeometry? margin;
  const MovieCardView({
    Key? key,
    this.onTap,
    required this.imageUrl,
    required this.title,
    required this.overview,
    required this.movieRating,
    required this.dateRelease,
    required this.voteCount,
    this.placeholder,
    this.errorPlaceholder,
    this.backgroundColor,
    this.border,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: RoundedContainerView(
        backgroundColor: backgroundColor,
        border: border,
        height: 160.0,
        margin: margin,
        borderRadius: BorderRadius.circular(8.0),
        child: LinearContainerView(
          padding: EdgeInsets.all(12.0),
          orientation: LinearContainerOrientation.HORIZONTAL,
          children: [
            RoundedContainerView(
              width: 96.0,
              height: 140.0,
              child: CacheImageView(
                imageUrl,
                fit: BoxFit.cover,
                rounded: BorderRadius.circular(8.0),
                placeholder: (context, url) => placeholderImage(placeholder),
                errorPlaceholder: (context, url, error) =>
                    placeholderImage(errorPlaceholder),
              ),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    left: 0.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          title,
                          textSize: 16.0,
                          maxLines: 2,
                          bold: true,
                        ),
                        SizedBox(height: 12.0),
                        Container(
                          width: double.infinity,
                          child: TextView(
                            overview,
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Row(
                      children: [
                        Expanded(child: popularitySection()),
                        Expanded(child: releaseSection())
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  Widget popularitySection() {
    return LinearContainerView(
      orientation: LinearContainerOrientation.HORIZONTAL,
      children: [
        Icon(
          Icons.star,
          size: 16.0,
          color: Colors.amber,
        ),
        SizedBox(width: 4.0),
        TextView(
          '$movieRating/',
          bold: true,
        ),
        TextView(
          '$voteCount',
          textSize: 10,
        ),
      ],
    );
  }

  Widget releaseSection() {
    return LinearContainerView(
      orientation: LinearContainerOrientation.HORIZONTAL,
      children: [
        Icon(
          Icons.calendar_today,
          size: 16.0,
          color: Colors.blueAccent,
        ),
        SizedBox(width: 4.0),
        TextView(
          dateRelease,
          textSize: 10,
        ),
      ],
    );
  }

  Widget placeholderImage(String? location) {
    final path = location.orEmpty();
    if (path.isNotEmpty) {
      return AssetImageView(
        path: path,
        rounded: BorderRadius.circular(8.0),
        fit: BoxFit.cover,
      );
    }
    return Container();
  }
}
