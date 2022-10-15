import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState.LOADING);

  void showLoadingState() {
    emit(HomeState.LOADING);
  }

  void showErrorState() {
    emit(HomeState.ERROR);
  }
}
