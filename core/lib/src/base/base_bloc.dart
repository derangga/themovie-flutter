import 'package:core/src/base/base_event_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<Event extends BlocEvent, State extends BlocState>
    extends Bloc<Event, State> {
  BaseBloc(State initialState) : super(initialState);
}
