import 'package:themovie_flutter/src/data/local/db/tv_show_favorite_dao.dart';
import 'package:themovie_flutter/src/data/local/tv_show_local_source.dart';
import 'package:themovie_flutter/src/data/model/tv_show.dart';
import '../mapper/tv_show_mapper.dart';

class TvShowLocalSourceImpl extends TvShowLocalSource {
  final TvShowFavoriteDao _dao;

  TvShowLocalSourceImpl(this._dao);

  @override
  Future<int> deleteAllTvShow() async {
    return await _dao.deleteAllTvShow();
  }

  @override
  Future<int> deleteTvShow(TvShow tvShow) async {
    final entity = tvShow.toEntity();
    return await _dao.deleteTvShow(entity);
  }

  @override
  Future<List<TvShow>> getAllMovie() async {
    final entity = await _dao.getAllTvShow();
    return entity.map((e) => e.toModel() ?? TvShow.empty()).toList();
  }

  @override
  Future<TvShow?> getTvShowFavoriteById(int tvShowId) async {
    final entity = await _dao.getTvShowFavoriteById(tvShowId);
    return entity?.toModel();
  }

  @override
  Future<int> insertTvShow(TvShow tvShow) async {
    final entity = tvShow.toEntity();
    return await _dao.insertTvShow(entity);
  }

  @override
  Future<bool> isAlreadyFavorite(int tvShowId) async {
    final entity = await getTvShowFavoriteById(tvShowId);
    return entity != null;
  }
}
