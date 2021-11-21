import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_event_state.dart';

abstract class BaseBloc<Event extends BlocEvent, State extends BlocState>
    extends Bloc<Event, State> {
  BaseBloc(State initialState) : super(initialState);
}
