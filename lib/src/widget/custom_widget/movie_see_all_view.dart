import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/widget/container/rounded_container_view.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';

class MovieSeeAllView extends StatelessWidget {
  final double width, height;
  final EdgeInsetsGeometry? margin;
  final double? iconSize;
  final double textSize;
  final Color? backgroundColor, iconColor, textColor;
  final IconData? iconData;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final GestureTapCallback? onTap;
  MovieSeeAllView({
    Key? key,
    required this.width,
    required this.height,
    this.margin,
    this.iconSize,
    this.textSize = 12,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.iconData,
    this.border,
    this.borderRadius,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainerView(
      width: width,
      height: height,
      margin: margin,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      border: border,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(height: 16),
            TextView(
              'See all',
              textColor: textColor,
              textSize: textSize,
            )
          ],
        ),
      ),
    );
  }
}
