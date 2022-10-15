import 'package:flutter_bloc/flutter_bloc.dart';

part './account_event_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(InitialState());
}
