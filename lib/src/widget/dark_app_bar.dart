import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';

class DarkAppBar extends AppBar {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  DarkAppBar({
    this.title,
    this.leading,
    this.actions,
  }) : super(
            title: title,
            backgroundColor: ColorTheme.primaryDark,
            leading: leading,
            actions: actions);
}
