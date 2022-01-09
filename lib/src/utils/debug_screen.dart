import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';
import 'package:themovie_flutter/src/widget/button/button_view.dart';
import 'package:themovie_flutter/src/widget/loading/circular_loading_view.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  final String _overview =
      "For Peter Parker, life is busy. Between taking out the bad guys as Spider-Man and spending time with the person he loves, Gwen Stacy, high school graduation cannot come quickly enough. Peter has not forgotten about the promise he made to Gwen’s father to protect her by staying away, but that is a promise he cannot keep. Things will change for Peter when a new villain, Electro, emerges, an old friend, Harry Osborn, returns, and Peter uncovers new clues about his past.";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Debug',
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Debug Screen'),
          ),
          body: Center(
            child: ButtonView(
              text: TextView('Press Me'),
              color: ColorTheme.light_brown,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
