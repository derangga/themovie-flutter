import 'package:themovie_flutter/src/data/remote/config/failure.dart';
import 'package:themovie_flutter/src/data/model/tv_show.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:themovie_flutter/src/data/remote/source/search_remote_source.dart';

import '../endpoint.dart';
import '../service/http_request_service.dart';
import '../../mapper/movie_mapper.dart';
import '../../mapper/tv_show_mapper.dart';

class SearchRemoteSourceImpl extends SearchRemoteSource {
  final HttpRequestService service;
  SearchRemoteSourceImpl(this.service);
  @override
  Future<Either<Failure, List<Movie>>> searchMovie(
    String query,
    int page,
  ) async {
    final url =
        '${Endpoint.SEARCH_MOVIE}?api_key=${service.token}&query=$query&page=$page';
    final result = await service.get<List<Movie>>(url, converter: (response) {
      final List<Movie> movies = [];
      if (response['results'] != null) {
        response['results'].forEach(
          (v) {
            movies.add(MovieDTO.fromJson(v).toModel());
          },
        );
      }
      return movies;
    });
    return result;
  }

  @override
  Future<Either<Failure, List<TvShow>>> searchTvShow(
    String query,
    int page,
  ) async {
    final url =
        '${Endpoint.SEARCH_TVSHOW}?api_key=${service.token}&query=$query&page=$page';
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
