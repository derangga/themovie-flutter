import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';

class DarkAppBar extends AppBar {
  final Widget? title;
  final Widget? leading;
  DarkAppBar({
    this.title,
    this.leading,
  }) : super(
          title: title,
          backgroundColor: ColorTheme.primaryDark,
          leading: leading,
        );
}
