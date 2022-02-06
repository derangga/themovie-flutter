import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/widget/app_scaffold.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Debug',
      theme: ThemeData.dark(),
      home: SafeArea(
        child: AppScaffold(
          appBar: AppBar(
            title: Text('Debug Screen'),
          ),
          body: Container(),
        ),
      ),
    );
  }
}
