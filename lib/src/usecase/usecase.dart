import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/remote/config/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
