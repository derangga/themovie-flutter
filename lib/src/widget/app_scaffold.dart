import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';

class AppScaffold extends Scaffold {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  AppScaffold({this.appBar, this.body, this.bottomNavigationBar})
      : super(
          backgroundColor: ColorTheme.primary,
          appBar: appBar,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
        );
}
