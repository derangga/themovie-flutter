import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../resources/color_theme.dart';
import '../container/linear_container_view.dart';
import '../container/rounded_container_view.dart';
import '../image/image_view.dart';
import '../text/text_view.dart';

class MovieTrailerView extends StatelessWidget {
  final String imageUrl, title, subtitle;
  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorPlaceholder;
  final EdgeInsetsGeometry? margin;
  final bool showSubtitle;
  final GestureTapCallback? onTap;
  const MovieTrailerView({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.showSubtitle = false,
    this.placeholder,
    this.errorPlaceholder,
    this.margin,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: LinearContainerView(
        orientation: LinearContainerOrientation.HORIZONTAL,
        mainAxisAlignment: MainAxisAlignment.start,
        height: 100,
        background: ColorTheme.primaryDark,
        padding: EdgeInsets.all(8.0),
        borderRadius: BorderRadius.circular(4.0),
        margin: margin,
        children: [
          Stack(
            children: [
              Container(
                width: 120.0,
                child: CacheImageView(
                  imageUrl,
                  placeholder: placeholder,
                  errorPlaceholder: errorPlaceholder,
                  fit: BoxFit.cover,
                  rounded: BorderRadius.circular(4.0),
                ),
              ),
              Positioned(
                top: 0.0,
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white,
                  size: 48.0,
                ),
              )
            ],
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  title,
                  bold: true,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 8.0,
                ),
                subTitleView(),
              ],
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget subTitleView() {
    return Visibility(
      visible: showSubtitle,
      child: RoundedContainerView(
        padding: EdgeInsets.all(4.0),
        child: TextView(
          subtitle,
          textSize: 10.0,
        ),
        borderRadius: BorderRadius.circular(4.0),
        backgroundColor: Colors.grey[600],
      ),
    );
  }
}
