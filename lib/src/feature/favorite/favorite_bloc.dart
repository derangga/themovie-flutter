import 'package:themovie_flutter/src/core/base/base_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_event_state.dart';

part 'favorite_event_state.dart';

class FavoriteBloc extends BaseBloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(InitialState());
}
