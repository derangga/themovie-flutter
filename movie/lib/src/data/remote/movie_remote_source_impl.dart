import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import 'endpoint.dart';
import 'movie_remote_source.dart';
import '../model/movie.dart';
import '../model/detail_movie.dart';
import '../mapper/movie_mapper.dart';

class MovieRemoteSourceImpl extends MovieRemoteSource {
  MovieRemoteSourceImpl(Dio dio, Logger logger) : super(dio, logger);

  @override
  Future<Either<Failure, DetailMovie>> getDetailMovie(int movieId) async {
    String url =
        "${Endpoint.DETAIL_MOVIE.replaceAll(Endpoint.MOVIE_ID, '$movieId')}";
    var result = await get<DetailMovie>(url,
        converter: (json) => DetailMovieDTO.fromJson(json).toModel());
    return result;
  }

  @override
  Future<Either<Failure, Movies>> getDiscoverMovie(int page) async {
    String url =
        '${Endpoint.DISCOVER_MOVIE}?api_key=$token&sort_by=popularity.desc&page=$page';
    var result = await get<Movies>(url,
        converter: (json) => MoviesDTO.fromJson(json).toModel());
    return result;
  }
}
