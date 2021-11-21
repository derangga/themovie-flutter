import 'package:dartz/dartz.dart';
import '../logger/app_logger.dart';
import 'base/base_repository.dart';
import '../data/config/failure.dart';
import '../data/model/genre.dart';

abstract class GenreRepository extends BaseRepository {
  GenreRepository(AppLogger logger) : super(logger);

  Future<Either<Failure, ListGenre<List<Genre>>>> getGenreMovieRemote();
}
