import 'package:logger/logger.dart';
import '../local/db/movie_dao.dart';
import '../local/db/movie_db.dart';
import '../local/movie_local_source.dart';
import '../model/movie.dart';
import '../mapper/movie_mapper.dart';

class MovieLocalSourceImpl extends MovieLocalSource {
  final MovieDao _movieDao;
  MovieLocalSourceImpl(Logger logger, this._movieDao) : super(logger);

  @override
  Future deleteMovie(MovieEntityData movie) async {
    await _movieDao.deleteMovie(movie);
  }

  @override
  Future<List<Movie>> getAllMovie() async {
    var data = await _movieDao.getAllMovie();
    return data.map((e) => e.toModel()).toList();
  }

  @override
  Future insertMovie(MovieEntityData movie) async {
    await _movieDao.insertMovie(movie);
  }

  @override
  Future deleteAllMovie() async {
    await _movieDao.deleteAllMovie();
  }
}
