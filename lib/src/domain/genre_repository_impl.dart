import 'package:dartz/dartz.dart';
import '../logger/app_logger.dart';
import '../data/config/failure.dart';
import '../data/remote/movie_remote_source.dart';
import '../data/model/genre.dart';
import 'genre_repository.dart';

class GenreRepositoryImpl extends GenreRepository {
  final MovieRemoteSource? _remoteSource;
  GenreRepositoryImpl(AppLogger logger, this._remoteSource) : super(logger);

  @override
  Future<Either<Failure, ListGenre<List<Genre>>>> getGenreMovieRemote() async {
    return await _remoteSource!.getGenreMovie();
  }
}
