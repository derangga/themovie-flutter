import 'package:flutter/foundation.dart';

@immutable
abstract class BlocState {}

enum ApiState { LOADING, SUCCESS, FAILED }

@immutable
abstract class BlocEvent {}
