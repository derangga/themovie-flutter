import 'package:themovie_flutter/src/data/model/tv_show.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:themovie_flutter/src/data/remote/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/remote/endpoint.dart';
import '../../mapper/movie_mapper.dart';
import '../../mapper/tv_show_mapper.dart';
import '../service/http_request_service.dart';
import 'trending_remote_source.dart';

class TrendingRemoteSourceImpl extends TrendingRemoteSource {
  final HttpRequestService service;
  TrendingRemoteSourceImpl(this.service);

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovie() async {
    String url = '${Endpoint.TRENDING_MOVIE}?api_key=${service.token}';
    final result = await service.get<List<Movie>>(url, converter: (response) {
      final List<Movie> movies = List.empty(growable: true);
      if (response['results'] != null) {
        response['results'].forEach(
          (movieDto) {
            movies.add(MovieDTO.fromJson(movieDto).toModel());
          },
        );
      }
      return movies;
    });
    return result;
  }

  @override
  Future<Either<Failure, List<TvShow>>> getTrendingTv() async {
    String url = '${Endpoint.TRENDING_TV_SHOW}?api_key=${service.token}';
    final result = await service.get<List<TvShow>>(url, converter: (response) {
      final List<TvShow> tvShows = List.empty(growable: true);
      if (response['results'] != null) {
        response['results'].forEach((v) {
          tvShows.add(TvShowDTO.fromJson(v).toModel());
        });
      }
      return tvShows;
    });
    return result;
  }
}
