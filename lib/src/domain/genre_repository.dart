import 'package:dartz/dartz.dart';
import '../data/config/failure.dart';
import '../data/model/genre.dart';

abstract class GenreRepository {
  Future<Either<Failure, ListGenre<List<Genre>>>> getGenreMovieRemote();
}
