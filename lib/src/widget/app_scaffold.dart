import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';

class AppScaffold extends Scaffold {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  AppScaffold({
    this.appBar,
    this.body,
  }) : super(
          backgroundColor: ColorTheme.primary,
          appBar: appBar,
          body: body,
        );
}
