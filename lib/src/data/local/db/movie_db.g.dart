// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MovieEntityData extends DataClass implements Insertable<MovieEntityData> {
  final bool adult;
  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final String voteAverage;
  final int voteCount;
  MovieEntityData(
      {required this.adult,
      required this.backdropPath,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});
  factory MovieEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MovieEntityData(
      adult: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}adult'])!,
      backdropPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop_path'])!,
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      originalLanguage: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}original_language'])!,
      originalTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}original_title'])!,
      overview: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}overview'])!,
      popularity: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}popularity'])!,
      posterPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path'])!,
      releaseDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      video: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}video'])!,
      voteAverage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average'])!,
      voteCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_count'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['adult'] = Variable<bool>(adult);
    map['backdrop_path'] = Variable<String>(backdropPath);
    map['id'] = Variable<int>(id);
    map['original_language'] = Variable<String>(originalLanguage);
    map['original_title'] = Variable<String>(originalTitle);
    map['overview'] = Variable<String>(overview);
    map['popularity'] = Variable<double>(popularity);
    map['poster_path'] = Variable<String>(posterPath);
    map['release_date'] = Variable<String>(releaseDate);
    map['title'] = Variable<String>(title);
    map['video'] = Variable<bool>(video);
    map['vote_average'] = Variable<String>(voteAverage);
    map['vote_count'] = Variable<int>(voteCount);
    return map;
  }

  MovieEntityCompanion toCompanion(bool nullToAbsent) {
    return MovieEntityCompanion(
      adult: Value(adult),
      backdropPath: Value(backdropPath),
      id: Value(id),
      originalLanguage: Value(originalLanguage),
      originalTitle: Value(originalTitle),
      overview: Value(overview),
      popularity: Value(popularity),
      posterPath: Value(posterPath),
      releaseDate: Value(releaseDate),
      title: Value(title),
      video: Value(video),
      voteAverage: Value(voteAverage),
      voteCount: Value(voteCount),
    );
  }

  factory MovieEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MovieEntityData(
      adult: serializer.fromJson<bool>(json['adult']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      id: serializer.fromJson<int>(json['id']),
      originalLanguage: serializer.fromJson<String>(json['originalLanguage']),
      originalTitle: serializer.fromJson<String>(json['originalTitle']),
      overview: serializer.fromJson<String>(json['overview']),
      popularity: serializer.fromJson<double>(json['popularity']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      title: serializer.fromJson<String>(json['title']),
      video: serializer.fromJson<bool>(json['video']),
      voteAverage: serializer.fromJson<String>(json['voteAverage']),
      voteCount: serializer.fromJson<int>(json['voteCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'adult': serializer.toJson<bool>(adult),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'id': serializer.toJson<int>(id),
      'originalLanguage': serializer.toJson<String>(originalLanguage),
      'originalTitle': serializer.toJson<String>(originalTitle),
      'overview': serializer.toJson<String>(overview),
      'popularity': serializer.toJson<double>(popularity),
      'posterPath': serializer.toJson<String>(posterPath),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'title': serializer.toJson<String>(title),
      'video': serializer.toJson<bool>(video),
      'voteAverage': serializer.toJson<String>(voteAverage),
      'voteCount': serializer.toJson<int>(voteCount),
    };
  }

  MovieEntityData copyWith(
          {bool? adult,
          String? backdropPath,
          int? id,
          String? originalLanguage,
          String? originalTitle,
          String? overview,
          double? popularity,
          String? posterPath,
          String? releaseDate,
          String? title,
          bool? video,
          String? voteAverage,
          int? voteCount}) =>
      MovieEntityData(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        id: id ?? this.id,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );
  @override
  String toString() {
    return (StringBuffer('MovieEntityData(')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('id: $id, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('popularity: $popularity, ')
          ..write('posterPath: $posterPath, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('title: $title, ')
          ..write('video: $video, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      adult,
      backdropPath,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieEntityData &&
          other.adult == this.adult &&
          other.backdropPath == this.backdropPath &&
          other.id == this.id &&
          other.originalLanguage == this.originalLanguage &&
          other.originalTitle == this.originalTitle &&
          other.overview == this.overview &&
          other.popularity == this.popularity &&
          other.posterPath == this.posterPath &&
          other.releaseDate == this.releaseDate &&
          other.title == this.title &&
          other.video == this.video &&
          other.voteAverage == this.voteAverage &&
          other.voteCount == this.voteCount);
}

class MovieEntityCompanion extends UpdateCompanion<MovieEntityData> {
  final Value<bool> adult;
  final Value<String> backdropPath;
  final Value<int> id;
  final Value<String> originalLanguage;
  final Value<String> originalTitle;
  final Value<String> overview;
  final Value<double> popularity;
  final Value<String> posterPath;
  final Value<String> releaseDate;
  final Value<String> title;
  final Value<bool> video;
  final Value<String> voteAverage;
  final Value<int> voteCount;
  const MovieEntityCompanion({
    this.adult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.id = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.overview = const Value.absent(),
    this.popularity = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.title = const Value.absent(),
    this.video = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
  });
  MovieEntityCompanion.insert({
    required bool adult,
    required String backdropPath,
    required int id,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required String releaseDate,
    required String title,
    required bool video,
    required String voteAverage,
    required int voteCount,
  })  : adult = Value(adult),
        backdropPath = Value(backdropPath),
        id = Value(id),
        originalLanguage = Value(originalLanguage),
        originalTitle = Value(originalTitle),
        overview = Value(overview),
        popularity = Value(popularity),
        posterPath = Value(posterPath),
        releaseDate = Value(releaseDate),
        title = Value(title),
        video = Value(video),
        voteAverage = Value(voteAverage),
        voteCount = Value(voteCount);
  static Insertable<MovieEntityData> custom({
    Expression<bool>? adult,
    Expression<String>? backdropPath,
    Expression<int>? id,
    Expression<String>? originalLanguage,
    Expression<String>? originalTitle,
    Expression<String>? overview,
    Expression<double>? popularity,
    Expression<String>? posterPath,
    Expression<String>? releaseDate,
    Expression<String>? title,
    Expression<bool>? video,
    Expression<String>? voteAverage,
    Expression<int>? voteCount,
  }) {
    return RawValuesInsertable({
      if (adult != null) 'adult': adult,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (id != null) 'id': id,
      if (originalLanguage != null) 'original_language': originalLanguage,
      if (originalTitle != null) 'original_title': originalTitle,
      if (overview != null) 'overview': overview,
      if (popularity != null) 'popularity': popularity,
      if (posterPath != null) 'poster_path': posterPath,
      if (releaseDate != null) 'release_date': releaseDate,
      if (title != null) 'title': title,
      if (video != null) 'video': video,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (voteCount != null) 'vote_count': voteCount,
    });
  }

  MovieEntityCompanion copyWith(
      {Value<bool>? adult,
      Value<String>? backdropPath,
      Value<int>? id,
      Value<String>? originalLanguage,
      Value<String>? originalTitle,
      Value<String>? overview,
      Value<double>? popularity,
      Value<String>? posterPath,
      Value<String>? releaseDate,
      Value<String>? title,
      Value<bool>? video,
      Value<String>? voteAverage,
      Value<int>? voteCount}) {
    return MovieEntityCompanion(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      id: id ?? this.id,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (adult.present) {
      map['adult'] = Variable<bool>(adult.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (originalLanguage.present) {
      map['original_language'] = Variable<String>(originalLanguage.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (popularity.present) {
      map['popularity'] = Variable<double>(popularity.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (video.present) {
      map['video'] = Variable<bool>(video.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<String>(voteAverage.value);
    }
    if (voteCount.present) {
      map['vote_count'] = Variable<int>(voteCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieEntityCompanion(')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('id: $id, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('popularity: $popularity, ')
          ..write('posterPath: $posterPath, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('title: $title, ')
          ..write('video: $video, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount')
          ..write(')'))
        .toString();
  }
}

class $MovieEntityTable extends MovieEntity
    with TableInfo<$MovieEntityTable, MovieEntityData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MovieEntityTable(this._db, [this._alias]);
  final VerificationMeta _adultMeta = const VerificationMeta('adult');
  late final GeneratedColumn<bool?> adult = GeneratedColumn<bool?>(
      'adult', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (adult IN (0, 1))');
  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  late final GeneratedColumn<String?> backdropPath = GeneratedColumn<String?>(
      'backdrop_path', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _originalLanguageMeta =
      const VerificationMeta('originalLanguage');
  late final GeneratedColumn<String?> originalLanguage =
      GeneratedColumn<String?>('original_language', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  late final GeneratedColumn<String?> originalTitle = GeneratedColumn<String?>(
      'original_title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  late final GeneratedColumn<String?> overview = GeneratedColumn<String?>(
      'overview', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _popularityMeta = const VerificationMeta('popularity');
  late final GeneratedColumn<double?> popularity = GeneratedColumn<double?>(
      'popularity', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  late final GeneratedColumn<String?> posterPath = GeneratedColumn<String?>(
      'poster_path', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  late final GeneratedColumn<String?> releaseDate = GeneratedColumn<String?>(
      'release_date', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _videoMeta = const VerificationMeta('video');
  late final GeneratedColumn<bool?> video = GeneratedColumn<bool?>(
      'video', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (video IN (0, 1))');
  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  late final GeneratedColumn<String?> voteAverage = GeneratedColumn<String?>(
      'vote_average', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  late final GeneratedColumn<int?> voteCount = GeneratedColumn<int?>(
      'vote_count', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        adult,
        backdropPath,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount
      ];
  @override
  String get aliasedName => _alias ?? 'movie_entity';
  @override
  String get actualTableName => 'movie_entity';
  @override
  VerificationContext validateIntegrity(Insertable<MovieEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('adult')) {
      context.handle(
          _adultMeta, adult.isAcceptableOrUnknown(data['adult']!, _adultMeta));
    } else if (isInserting) {
      context.missing(_adultMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('original_language')) {
      context.handle(
          _originalLanguageMeta,
          originalLanguage.isAcceptableOrUnknown(
              data['original_language']!, _originalLanguageMeta));
    } else if (isInserting) {
      context.missing(_originalLanguageMeta);
    }
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    } else if (isInserting) {
      context.missing(_originalTitleMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('popularity')) {
      context.handle(
          _popularityMeta,
          popularity.isAcceptableOrUnknown(
              data['popularity']!, _popularityMeta));
    } else if (isInserting) {
      context.missing(_popularityMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('video')) {
      context.handle(
          _videoMeta, video.isAcceptableOrUnknown(data['video']!, _videoMeta));
    } else if (isInserting) {
      context.missing(_videoMeta);
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('vote_count')) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableOrUnknown(data['vote_count']!, _voteCountMeta));
    } else if (isInserting) {
      context.missing(_voteCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  MovieEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MovieEntityData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MovieEntityTable createAlias(String alias) {
    return $MovieEntityTable(_db, alias);
  }
}

abstract class _$MovieDb extends GeneratedDatabase {
  _$MovieDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MovieEntityTable movieEntity = $MovieEntityTable(this);
  late final MovieDao movieDao = MovieDao(this as MovieDb);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movieEntity];
}
