import '../local/db/genre_dao.dart';
import '../local/db/genre_db.dart';
import '../local/genre_local_source.dart';
import '../model/genre.dart';
import '../mapper/genre_mapper.dart';

class GenreMovieLocalSourceImpl extends GenreMovieLocalSource {
  final GenreDao _genreDao;
  GenreMovieLocalSourceImpl(this._genreDao) : super();

  @override
  Future deleteGenreMovie(GenreMovieEntityData genre) async {
    await _genreDao.deleteGenreMovie(genre);
  }

  @override
  Future<List<Genre>> getAllGenreMovie() async {
    var data = await _genreDao.getAllGenreMovie();
    return data.map((e) => e.toModel()).toList();
  }

  @override
  Future insertGenreMovie(GenreMovieEntityData genre) async {
    await _genreDao.insertGenreMovie(genre);
  }

  @override
  Future deleteAllGenreMovie() async {
    await _genreDao.deleteAllGenreMovie();
  }
}
