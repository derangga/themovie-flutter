part of './account_bloc.dart';

abstract class AccountEvent extends BlocEvent {}

abstract class AccountState extends BlocState {}

class InitialState extends AccountState {}
