import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';

class CircularLoadingView extends StatelessWidget {
  final Color? color;
  const CircularLoadingView({Key? key, this.color = ColorTheme.light_brown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}
