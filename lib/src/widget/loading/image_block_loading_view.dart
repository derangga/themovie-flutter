import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';
import 'package:themovie_flutter/src/widget/container/rounded_container_view.dart';

class ImageBlockLoadingView extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  const ImageBlockLoadingView({
    Key? key,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemCount = size.width ~/ 124.0;
    return Container(
      height: 184.0,
      margin: margin,
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, position) => RoundedContainerView(
          width: 124.0,
          height: 184.0,
          backgroundColor: ColorTheme.primaryDark,
          borderRadius: BorderRadius.circular(4),
        ),
        separatorBuilder: (context, position) => SizedBox(
          width: 8.0,
        ),
        itemCount: itemCount,
      ),
    );
  }
}
