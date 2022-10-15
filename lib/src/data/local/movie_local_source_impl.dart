import 'package:themovie_flutter/src/data/local/db/movie_favorite_dao.dart';

import '../local/movie_local_source.dart';
import '../model/movie.dart';
import '../mapper/movie_mapper.dart';

class MovieLocalSourceImpl extends MovieLocalSource {
  final MovieFavoriteDao _movieDao;

  MovieLocalSourceImpl(this._movieDao);

  @override
  Future<int> deleteMovie(Movie movie) async {
    final entity = movie.toEntity();
    return await _movieDao.deleteMovie(entity);
  }

  @override
  Future<List<Movie>> getAllMovie() async {
    var data = await _movieDao.getAllMovie();
    return data.map((e) => e.toModel() ?? Movie.empty()).toList();
  }

  @override
  Future<int> insertMovie(Movie movie) async {
    final entity = movie.toEntity();
    return await _movieDao.insertMovie(entity);
  }

  @override
  Future<int> deleteAllMovie() async {
    return await _movieDao.deleteAllMovie();
  }

  @override
  Future<Movie?> getMovieFavoriteById(int movieId) async {
    final favoriteMovieEntity = await _movieDao.getMovieFavoriteById(movieId);
    return favoriteMovieEntity.toModel();
  }

  @override
  Future<bool> isAlreadyFavorite(int movieId) async {
    final entity = await getMovieFavoriteById(movieId);
    return entity != null;
  }
}
