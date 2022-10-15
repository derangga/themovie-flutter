import 'package:drift/drift.dart';

class MovieFavoriteEntity extends Table {
  IntColumn get id => integer()();
  BoolColumn? get adult => boolean()();
  TextColumn? get backdropPath => text()();
  TextColumn? get originalLanguage => text()();
  TextColumn? get originalTitle => text()();
  TextColumn? get overview => text()();
  RealColumn? get popularity => real()();
  TextColumn? get posterPath => text()();
  TextColumn? get releaseDate => text()();
  TextColumn? get title => text()();
  BoolColumn? get video => boolean()();
  TextColumn? get voteAverage => text()();
  IntColumn? get voteCount => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
