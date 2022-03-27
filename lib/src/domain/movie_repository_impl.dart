import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/cast_and_crew.dart';
import 'package:themovie_flutter/src/data/model/detail_movie.dart';
import 'package:themovie_flutter/src/data/model/genre.dart';
import 'package:themovie_flutter/src/data/model/videos.dart';
import '../data/config/failure.dart';
import '../data/remote/movie_remote_source.dart';
import '../data/model/movie.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteSource _remoteSource;

  MovieRepositoryImpl(this._remoteSource);

  @override
  Future<Either<Failure, DetailMovie>> getMovieById(int movieId) async {
    return await _remoteSource.getMovieById(movieId);
  }

  @override
  Future<Either<Failure, List<Movie>>> getDiscoverMovie(int page) async {
    return await _remoteSource.getDiscoverMovie(page);
  }

  @override
  Future<Either<Failure, List<Cast>>> getCastAndCrew(int movieId) async {
    return await _remoteSource.getCastAndCrew(movieId);
  }

  @override
  Future<Either<Failure, List<Movie>>> getSimilarMovie(int movieId) async {
    return await _remoteSource.getSimilarMovie(movieId);
  }

  @override
  Future<Either<Failure, List<Genre>>> getGenreMovie() async {
    return await _remoteSource.getGenreMovie();
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovie(int page) async {
    return await _remoteSource.getUpcomingMovie(page);
  }

  @override
  Future<Either<Failure, List<Video>>> getTrailerMovie(int movieId) async {
    return await _remoteSource.getTrailerMovie(movieId);
  }
}
