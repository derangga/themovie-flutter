import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/widget/image/asset_image_view.dart';
import 'package:themovie_flutter/src/widget/image/image_view.dart';
import '../resources/color_theme.dart';

class PortraitContent extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final String placeholderPath;
  final String errorPlaceholderPath;
  final String imageUrl;
  final Widget? content;
  final Widget? subContent;
  final GestureTapCallback? onTap;

  PortraitContent({
    required this.imageUrl,
    required this.placeholderPath,
    required this.errorPlaceholderPath,
    this.margin,
    this.content,
    this.subContent,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 260.0,
        width: 140.0,
        margin: margin,
        padding: EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
            color: ColorTheme.primaryDark,
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160.0,
              width: double.infinity,
              child: CacheImageView(
                imageUrl,
                rounded: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                fit: BoxFit.cover,
                placeholder: (context, url) => AssetImageView(
                  path: placeholderPath,
                  rounded: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  fit: BoxFit.cover,
                ),
                errorPlaceholder: (context, url, error) => AssetImageView(
                  path: errorPlaceholderPath,
                  rounded: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: content,
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: subContent,
            )
          ],
        ),
      ),
    );
  }
}
