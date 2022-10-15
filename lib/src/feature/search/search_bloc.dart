import 'package:flutter_bloc/flutter_bloc.dart';

part './search_event_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialState());
}
