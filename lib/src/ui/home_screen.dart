import 'package:core/core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Container(
        child: Center(
          child: RaisedButton(onPressed: () {
            Navigator.pushNamed(context, RouteApp.DISCOVER_MOVIE_SCREEN);
          }),
        ),
      ),
    );
  }
}
