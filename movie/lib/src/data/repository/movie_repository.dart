import 'package:core/core.dart';

import '../model/movie.dart';
import '../model/detail_movie.dart';

abstract class MovieRepository {
  Future<Result<Movies>> getDiscoverMovie(int page);
  Future<Result<DetailMovie>> getDetailMovie(int movieId);
}
