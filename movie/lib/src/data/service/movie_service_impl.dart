import 'package:core/core.dart';

import 'endpoint.dart';
import '../service/movie_service.dart';
import '../model/movie.dart';
import '../model/detail_movie.dart';
import '../mapper/movie_mapper.dart';

class MovieServiceImpl extends MovieService {
  MovieServiceImpl(Dio dio) : super(dio);

  @override
  Future<Result<DetailMovie>> getDetailMovie(int movieId) async {
    String url =
        "${Endpoint.DETAIL_MOVIE.replaceAll(Endpoint.MOVIE_ID, '$movieId')}";
    var result = await getMethod<DetailMovie>(url,
        converter: (json) => DetailMovieDTO.fromJson(json).toModel());
    return result;
  }

  @override
  Future<Result<Movies>> getDiscoverMovie(int page) async {
    String url =
        '${Endpoint.DISCOVER_MOVIE}?api_key=$token&sort_by=popularity.desc&page=$page';
    var result = await getMethod<Movies>(url,
        converter: (json) => MoviesDTO.fromJson(json).toModel());
    return result;
  }
}
