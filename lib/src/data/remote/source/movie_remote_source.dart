import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/videos.dart';
import '../../model/cast_and_crew.dart';
import '../../model/genre.dart';
import '../../model/detail_movie.dart';
import '../config/failure.dart';
import '../../model/movie.dart';

abstract class MovieRemoteSource {
  Future<Either<Failure, List<Movie>>> getDiscoverMovie(int page);

  Future<Either<Failure, DetailMovie>> getMovieById(int movieId);

  Future<Either<Failure, List<Genre>>> getGenreMovie();

  Future<Either<Failure, List<Cast>>> getCastAndCrew(int movieId);

  Future<Either<Failure, List<Movie>>> getSimilarMovie(int movieId);

  Future<Either<Failure, List<Movie>>> getUpcomingMovie(int page);

  Future<Either<Failure, List<Video>>> getTrailerMovie(int movieId);
}
