import 'package:flutter/material.dart';
import '../../../core/base/base_stateful.dart';
import '../../../resources/color_theme.dart';
import 'trailer_tv_show_bloc.dart';

class TrailerTvShowScreen extends StatefulWidget {
  final int tvShowId;
  final String filmTitle;
  TrailerTvShowScreen(this.tvShowId, this.filmTitle);
  @override
  _TrailerTvShowScreenState createState() => _TrailerTvShowScreenState();
}

class _TrailerTvShowScreenState extends BaseState<TrailerTvShowBloc,
    TrailerTvShowState, TrailerTvShowScreen> {
  @override
  void setupOnInitState() {
    bloc.add(GetTrailerTvShowEvent(widget.tvShowId));
  }

  @override
  Widget mapStateToWidget(TrailerTvShowState state) {
    if (state is SuccessGetTrailerTvShowState) {
    } else if (state is ErrorGetTrailerTvShowState) {}
    return _loading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.primaryDark,
        title: Text('Trailer : ${widget.filmTitle}'),
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: ShapeDecoration(
              shape: CircleBorder(), color: ColorTheme.primaryDark),
          child: IconButton(
              //70 72 94
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context)),
        ),
      ),
    );
  }

  Widget _loading() {
    return Center(
        child: CircularProgressIndicator(backgroundColor: ColorTheme.light_brown));
  }
}
