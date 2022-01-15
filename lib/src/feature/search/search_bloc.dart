import 'package:themovie_flutter/src/core/base/base_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_event_state.dart';

part './search_event_state.dart';

class SearchBloc extends BaseBloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialState());
}
