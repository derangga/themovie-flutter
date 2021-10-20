import 'package:moor_flutter/moor_flutter.dart';
import '../../model/movie.dart';
import 'movie_dao.dart';

part 'movie_db.g.dart';

@UseMoor(tables: [MovieEntity], daos: [MovieDao])
class MovieDb extends _$MovieDb {
  MovieDb()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'movieDb.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
