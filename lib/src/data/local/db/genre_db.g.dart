// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class GenreMovieEntityData extends DataClass
    implements Insertable<GenreMovieEntityData> {
  final int id;
  final String name;
  GenreMovieEntityData({required this.id, required this.name});
  factory GenreMovieEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GenreMovieEntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  GenreMovieEntityCompanion toCompanion(bool nullToAbsent) {
    return GenreMovieEntityCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory GenreMovieEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GenreMovieEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  GenreMovieEntityData copyWith({int? id, String? name}) =>
      GenreMovieEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('GenreMovieEntityData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GenreMovieEntityData &&
          other.id == this.id &&
          other.name == this.name);
}

class GenreMovieEntityCompanion extends UpdateCompanion<GenreMovieEntityData> {
  final Value<int> id;
  final Value<String> name;
  const GenreMovieEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GenreMovieEntityCompanion.insert({
    required int id,
    required String name,
  })  : id = Value(id),
        name = Value(name);
  static Insertable<GenreMovieEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GenreMovieEntityCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return GenreMovieEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenreMovieEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $GenreMovieEntityTable extends GenreMovieEntity
    with TableInfo<$GenreMovieEntityTable, GenreMovieEntityData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GenreMovieEntityTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'genre_movie_entity';
  @override
  String get actualTableName => 'genre_movie_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<GenreMovieEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  GenreMovieEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GenreMovieEntityData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GenreMovieEntityTable createAlias(String alias) {
    return $GenreMovieEntityTable(_db, alias);
  }
}

abstract class _$GenreDb extends GeneratedDatabase {
  _$GenreDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $GenreMovieEntityTable genreMovieEntity =
      $GenreMovieEntityTable(this);
  late final GenreDao genreDao = GenreDao(this as GenreDb);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [genreMovieEntity];
}
