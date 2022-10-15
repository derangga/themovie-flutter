import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/model/videos.dart';
import '../../model/cast_and_crew.dart';
import '../../model/genre.dart';
import '../config/failure.dart';
import '../../model/movie.dart';
import '../../model/detail_movie.dart';
import '../../mapper/movie_mapper.dart';
import '../../mapper/genre_mapper.dart';
import '../../mapper/cast_and_crew_mapper.dart';
import '../../mapper/video_mapper.dart';
import '../service/http_request_service.dart';
import '../endpoint.dart';
import 'movie_remote_source.dart';

class MovieRemoteSourceImpl extends MovieRemoteSource {
  final HttpRequestService service;
  MovieRemoteSourceImpl(this.service);

  @override
  Future<Either<Failure, DetailMovie>> getMovieById(int movieId) async {
    String url =
        "${Endpoint.DETAIL_MOVIE.replaceAll(Endpoint.MOVIE_ID, '$movieId')}?api_key=${service.token}";
    final result = await service.get<DetailMovie>(
      url,
      converter: (json) => DetailMovieDTO.fromJson(json).toModel(),
    );
    return result;
  }

  @override
  Future<Either<Failure, List<Movie>>> getDiscoverMovie(int page) async {
    String url =
        '${Endpoint.DISCOVER_MOVIE}?api_key=${service.token}&sort_by=popularity.desc&page=$page';
    final result = await service.get<List<Movie>>(
      url,
      converter: (response) {
        final List<Movie> movies = [];
        if (response['results'] != null) {
          response['results'].forEach(
            (v) {
              movies.add(MovieDTO.fromJson(v).toModel());
            },
          );
        }
        return movies;
      },
    );
    return result;
  }

  @override
  Future<Either<Failure, List<Genre>>> getGenreMovie() async {
    String url =
        '${Endpoint.GENRE_MOVIE}?api_key=${service.token}&language=en-US';
    final result = await service.get<List<Genre>>(
      url,
      converter: (response) => GenresDTO.fromJson(response).toModel(),
    );
    return result;
  }

  @override
  Future<Either<Failure, List<Cast>>> getCastAndCrew(int movieId) async {
    String url =
        '${Endpoint.CREDITS_MOVIE.replaceAll(Endpoint.MOVIE_ID, "$movieId")}?api_key=${service.token}';
    final result = await service.get<List<Cast>>(
      url,
      converter: (response) {
        final List<Cast> casts = [];
        if (response['cast'] != null) {
          response['cast'].forEach(
            (v) {
              casts.add(CastDTO.fromJson(v).toModel());
            },
          );
        }
        return casts;
      },
    );
    return result;
  }

  @override
  Future<Either<Failure, List<Movie>>> getSimilarMovie(int movieId) async {
    String url =
        '${Endpoint.SIMILIAR_MOVIE.replaceAll(Endpoint.MOVIE_ID, "$movieId")}?api_key=${service.token}&sort_by=popularity.desc';
    final result = await service.get<List<Movie>>(
      url,
      converter: (response) {
        final List<Movie> movies = [];
        if (response['results'] != null) {
          response['results'].forEach(
            (v) {
              movies.add(MovieDTO.fromJson(v).toModel());
            },
          );
        }
        return movies;
      },
    );
    return result;
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovie(int page) async {
    String url =
        '${Endpoint.UPCOMING_MOVIE}?api_key=${service.token}&language=en-US&page=$page';
    final result = await service.get<List<Movie>>(
      url,
      converter: (response) {
        final List<Movie> movies = [];
        if (response['results'] != null) {
          response['results'].forEach(
            (v) {
              movies.add(MovieDTO.fromJson(v).toModel());
            },
          );
        }
        return movies;
      },
    );
    return result;
  }

  @override
  Future<Either<Failure, List<Video>>> getTrailerMovie(int movieId) async {
    String url =
        '${Endpoint.TRAILER_MOVIE.replaceAll(Endpoint.MOVIE_ID, "$movieId")}?api_key=${service.token}';
    final result = await service.get<List<Video>>(
      url,
      converter: (response) {
        final List<Video> videos = [];
        if (response['results'] != null) {
          response['results'].forEach(
            (v) {
              videos.add(VideoDTO.fromJson(v).toModel());
            },
          );
        }
        return videos;
      },
    );
    return result;
  }
}
