import 'package:drift/drift.dart';
import 'package:themovie_flutter/src/data/model/tv_show_favorite_entity.dart';

import 'app_database.dart';

part 'tv_show_favorite_dao.g.dart';

@DriftAccessor(tables: [TvShowFavoriteEntity])
class TvShowFavoriteDao extends DatabaseAccessor<AppDatabase>
    with _$TvShowFavoriteDaoMixin {
  TvShowFavoriteDao(AppDatabase db) : super(db);

  Future<int> insertTvShow(TvShowFavoriteEntityData tvShow) =>
      into(tvShowFavoriteEntity)
          .insert(tvShow, mode: InsertMode.insertOrReplace);
  Future<bool> updateTvShow(TvShowFavoriteEntityData tvShow) =>
      update(tvShowFavoriteEntity).replace(tvShow);
  Future<int> deleteTvShow(TvShowFavoriteEntityData tvShow) =>
      delete(tvShowFavoriteEntity).delete(tvShow);

  Future<int> deleteAllTvShow() => delete(tvShowFavoriteEntity).go();
  Future<List<TvShowFavoriteEntityData>> getAllTvShow() =>
      select(tvShowFavoriteEntity).get();

  Future<TvShowFavoriteEntityData?> getTvShowFavoriteById(int tvShowId) =>
      (select(tvShowFavoriteEntity)
            ..where((tbl) => tbl.id.equals(tvShowId))
            ..limit(1))
          .getSingleOrNull();
}
