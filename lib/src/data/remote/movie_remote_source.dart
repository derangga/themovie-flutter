import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../model/cast_and_crew.dart';
import '../base/base_remote.dart';
import '../model/genre.dart';
import '../model/detail_movie.dart';
import '../config/failure.dart';
import '../model/movie.dart';

abstract class MovieRemoteSource extends BaseRemote {
  MovieRemoteSource(Dio dio) : super(dio);

  Future<Either<Failure, List<Movie>>> getDiscoverMovie(int page);

  Future<Either<Failure, DetailMovie>> getMovieById(int movieId);

  Future<Either<Failure, ListGenre<List<Genre>>>> getGenreMovie();

  Future<Either<Failure, List<Cast>>> getCastAndCrew(int movieId);

  Future<Either<Failure, List<Movie>>> getSimilarMovie(int movieId);
}
