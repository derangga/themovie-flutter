import 'package:themovie_flutter/src/data/model/tv_show.dart';

abstract class TvShowLocalSource {
  Future<int> insertTvShow(TvShow tvShow);

  Future<int> deleteTvShow(TvShow tvShow);

  Future<int> deleteAllTvShow();

  Future<List<TvShow>> getAllMovie();

  Future<TvShow?> getTvShowFavoriteById(int tvShowId);

  Future<bool> isAlreadyFavorite(int tvShowId);
}
