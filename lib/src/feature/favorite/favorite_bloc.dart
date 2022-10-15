import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_event_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(InitialState());
}
