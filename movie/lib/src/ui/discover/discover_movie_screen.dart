import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:movie/movie.dart';

class DiscoverMovieScreen extends StatefulWidget {
  @override
  _DiscoverMovieScreenState createState() => _DiscoverMovieScreenState();
}

class _DiscoverMovieScreenState extends BaseState<DiscoverMovieBloc,
    DiscoverMovieState, DiscoverMovieScreen> {
  @override
  void setupOnInitState() {
    bloc.add(GetDiscoverMovieEvent());
  }

  @override
  Widget mapStateToWidget(DiscoverMovieState state) {
    if (state is SuccessGetDiscoverMovieState) {
      logInfo("movie list ${state.movies}");
    } else if (state is ErrorGetDiscoverMovieState) {
      logError("Error : ${state.message}");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocBuilder<DiscoverMovieBloc, DiscoverMovieState>(
            builder: (blocContext, state) {
          mapStateToWidget(state);
          return Center(child: Text('Dummy'));
        }),
      ),
    );
  }
}
