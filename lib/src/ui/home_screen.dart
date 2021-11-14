import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/navigation/route_app.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(onPressed: () {
                Navigator.pushNamed(context, RouteApp.DISCOVER_MOVIE_SCREEN);
              }),
              RaisedButton(onPressed: () {
                Navigator.pushNamed(context, RouteApp.DISCOVER_TV_SCREEN);
              })
            ],
          ),
        ),
      ),
    );
  }
}
