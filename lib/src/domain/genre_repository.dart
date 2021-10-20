import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'base/base_repository.dart';
import '../data/config/failure.dart';
import '../data/model/genre.dart';

abstract class GenreRepository extends BaseRepository {
  GenreRepository(Logger logger) : super(logger);

  Future<Either<Failure, ListGenre<List<Genre>>>> getGenreMovieRemote();
}
