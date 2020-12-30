import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:movie/movie.dart';

class DetailMovieScreen extends StatefulWidget {
  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState
    extends BaseState<DetailMovieBloc, DetailMovieState, DetailMovieScreen> {
  @override
  Widget mapStateToWidget(DetailMovieState state) {
    return null;
  }

  @override
  void setupOnInitState() {}

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
