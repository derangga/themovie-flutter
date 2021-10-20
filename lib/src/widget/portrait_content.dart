import 'package:flutter/material.dart';
import '../resources/drawable.dart';
import '../resources/color_theme.dart';

class PortraitContent extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final String imageUrl;
  final Widget content;
  final Widget subContent;

  PortraitContent(
      {@required this.height,
      @required this.width,
      @required this.imageUrl,
      this.margin,
      this.content,
      this.subContent})
      : assert(height != null),
        assert(width != null),
        assert(imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
            width: width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage.assetNetwork(
                placeholder: Drawable.NO_IMAGE,
                image: imageUrl,
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
    );
  }
}
