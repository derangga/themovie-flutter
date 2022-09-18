import 'package:flutter/material.dart';
import 'navigation/navigation_app.dart';
import 'navigation/route_app.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      onGenerateRoute: NavigationApp.generateRoute,
      initialRoute: RouteApp.HOME_SCREEN,
    );
  }
}
