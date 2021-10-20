import 'package:moor_flutter/moor_flutter.dart';
import '../../../data/local/db/genre_dao.dart';
import '../../model/genre.dart';

part 'genre_db.g.dart';

@UseMoor(tables: [GenreMovieEntity], daos: [GenreDao])
class GenreDb extends _$GenreDb {
  GenreDb()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'genreDb.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
