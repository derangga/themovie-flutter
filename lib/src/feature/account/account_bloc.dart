import 'package:themovie_flutter/src/core/base/base_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_event_state.dart';

part './account_event_state.dart';

class AccountBloc extends BaseBloc<AccountEvent, AccountState> {
  AccountBloc() : super(InitialState());
}
