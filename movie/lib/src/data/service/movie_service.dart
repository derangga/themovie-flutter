import 'package:core/core.dart';
import 'package:movie/src/data/model/detail_movie.dart';

import '../model/movie.dart';

abstract class MovieService extends BaseRemote {
  MovieService(Dio dio) : super(dio);

  Future<Result<Movies>> getDiscoverMovie(int page);
  Future<Result<DetailMovie>> getDetailMovie(int movieId);
}
