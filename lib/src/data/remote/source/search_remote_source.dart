import 'package:dartz/dartz.dart';

import '../../model/movie.dart';
import '../../model/tv_show.dart';
import '../config/failure.dart';

abstract class SearchRemoteSource {
  Future<Either<Failure, List<Movie>>> searchMovie(String query, int page);
  Future<Either<Failure, List<TvShow>>> searchTvShow(String query, int page);
}
