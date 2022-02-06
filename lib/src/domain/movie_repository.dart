import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/cast_and_crew.dart';
import 'package:themovie_flutter/src/data/model/detail_movie.dart';
import 'package:themovie_flutter/src/data/model/genre.dart';
import '../data/config/failure.dart';
import '../data/model/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getDiscoverMovie(int page);

  Future<Either<Failure, List<Cast>>> getCastAndCrew(int movieId);

  Future<Either<Failure, DetailMovie>> getMovieById(int movieId);

  Future<Either<Failure, List<Movie>>> getSimilarMovie(int movieId);

  Future<Either<Failure, List<Genre>>> getGenreMovie();

  Future<Either<Failure, List<Movie>>> getUpcomingMovie(int page);
}
