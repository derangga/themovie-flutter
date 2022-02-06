import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/widget/container/rounded_container_view.dart';
import 'package:themovie_flutter/src/widget/image/image_view.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';

class MovieImageView extends StatelessWidget {
  final String imageUrl;
  final String voteAverage;
  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorPlaceholder;
  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? margin;
  const MovieImageView({
    Key? key,
    required this.imageUrl,
    required this.voteAverage,
    this.onTap,
    this.placeholder,
    this.errorPlaceholder,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124.0,
      height: 184.0,
      margin: margin,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: CacheImageView(
                imageUrl,
                fit: BoxFit.cover,
                rounded: BorderRadius.circular(6.0),
                placeholder: placeholder,
                errorPlaceholder: errorPlaceholder,
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: RoundedContainerView(
                padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 8.0),
                backgroundColor: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(6.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16.0,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 4.0),
                    TextView(
                      '7.0',
                      bold: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
