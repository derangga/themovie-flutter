import 'package:drift/drift.dart';

class TvShowFavoriteEntity extends Table {
  IntColumn get id => integer()();
  TextColumn? get backdropPath => text()();
  TextColumn? get firstAirDate => text()();
  TextColumn? get name => text()();
  TextColumn? get originalLanguage => text()();
  TextColumn? get originalName => text()();
  TextColumn? get overview => text()();
  TextColumn? get posterPath => text()();
  TextColumn? get voteAverage => text()();
  IntColumn? get voteCount => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
