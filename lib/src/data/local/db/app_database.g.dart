// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MovieFavoriteEntityData extends DataClass
    implements Insertable<MovieFavoriteEntityData> {
  final int id;
  final bool adult;
  final String backdropPath;
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
  const MovieFavoriteEntityData(
      {required this.id,
      required this.adult,
      required this.backdropPath,
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['adult'] = Variable<bool>(adult);
    map['backdrop_path'] = Variable<String>(backdropPath);
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

  MovieFavoriteEntityCompanion toCompanion(bool nullToAbsent) {
    return MovieFavoriteEntityCompanion(
      id: Value(id),
      adult: Value(adult),
      backdropPath: Value(backdropPath),
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

  factory MovieFavoriteEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieFavoriteEntityData(
      id: serializer.fromJson<int>(json['id']),
      adult: serializer.fromJson<bool>(json['adult']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
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
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'adult': serializer.toJson<bool>(adult),
      'backdropPath': serializer.toJson<String>(backdropPath),
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

  MovieFavoriteEntityData copyWith(
          {int? id,
          bool? adult,
          String? backdropPath,
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
      MovieFavoriteEntityData(
        id: id ?? this.id,
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
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
    return (StringBuffer('MovieFavoriteEntityData(')
          ..write('id: $id, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
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
      id,
      adult,
      backdropPath,
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
      (other is MovieFavoriteEntityData &&
          other.id == this.id &&
          other.adult == this.adult &&
          other.backdropPath == this.backdropPath &&
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

class MovieFavoriteEntityCompanion
    extends UpdateCompanion<MovieFavoriteEntityData> {
  final Value<int> id;
  final Value<bool> adult;
  final Value<String> backdropPath;
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
  const MovieFavoriteEntityCompanion({
    this.id = const Value.absent(),
    this.adult = const Value.absent(),
    this.backdropPath = const Value.absent(),
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
  MovieFavoriteEntityCompanion.insert({
    this.id = const Value.absent(),
    required bool adult,
    required String backdropPath,
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
  static Insertable<MovieFavoriteEntityData> custom({
    Expression<int>? id,
    Expression<bool>? adult,
    Expression<String>? backdropPath,
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
      if (id != null) 'id': id,
      if (adult != null) 'adult': adult,
      if (backdropPath != null) 'backdrop_path': backdropPath,
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

  MovieFavoriteEntityCompanion copyWith(
      {Value<int>? id,
      Value<bool>? adult,
      Value<String>? backdropPath,
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
    return MovieFavoriteEntityCompanion(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
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
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (adult.present) {
      map['adult'] = Variable<bool>(adult.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
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
    return (StringBuffer('MovieFavoriteEntityCompanion(')
          ..write('id: $id, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
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

class $MovieFavoriteEntityTable extends MovieFavoriteEntity
    with TableInfo<$MovieFavoriteEntityTable, MovieFavoriteEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieFavoriteEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _adultMeta = const VerificationMeta('adult');
  @override
  late final GeneratedColumn<bool> adult = GeneratedColumn<bool>(
      'adult', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (adult IN (0, 1))');
  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _originalLanguageMeta =
      const VerificationMeta('originalLanguage');
  @override
  late final GeneratedColumn<String> originalLanguage = GeneratedColumn<String>(
      'original_language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
      'original_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _popularityMeta = const VerificationMeta('popularity');
  @override
  late final GeneratedColumn<double> popularity = GeneratedColumn<double>(
      'popularity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _videoMeta = const VerificationMeta('video');
  @override
  late final GeneratedColumn<bool> video = GeneratedColumn<bool>(
      'video', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (video IN (0, 1))');
  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<String> voteAverage = GeneratedColumn<String>(
      'vote_average', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  @override
  late final GeneratedColumn<int> voteCount = GeneratedColumn<int>(
      'vote_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        adult,
        backdropPath,
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
  String get aliasedName => _alias ?? 'movie_favorite_entity';
  @override
  String get actualTableName => 'movie_favorite_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<MovieFavoriteEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovieFavoriteEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovieFavoriteEntityData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      adult: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}adult'])!,
      backdropPath: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path'])!,
      originalLanguage: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}original_language'])!,
      originalTitle: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}original_title'])!,
      overview: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      popularity: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}popularity'])!,
      posterPath: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path'])!,
      releaseDate: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}release_date'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      video: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}video'])!,
      voteAverage: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}vote_average'])!,
      voteCount: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}vote_count'])!,
    );
  }

  @override
  $MovieFavoriteEntityTable createAlias(String alias) {
    return $MovieFavoriteEntityTable(attachedDatabase, alias);
  }
}

class TvShowFavoriteEntityData extends DataClass
    implements Insertable<TvShowFavoriteEntityData> {
  final int id;
  final String backdropPath;
  final String firstAirDate;
  final String name;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final String posterPath;
  final String voteAverage;
  final int voteCount;
  const TvShowFavoriteEntityData(
      {required this.id,
      required this.backdropPath,
      required this.firstAirDate,
      required this.name,
      required this.originalLanguage,
      required this.originalName,
      required this.overview,
      required this.posterPath,
      required this.voteAverage,
      required this.voteCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['backdrop_path'] = Variable<String>(backdropPath);
    map['first_air_date'] = Variable<String>(firstAirDate);
    map['name'] = Variable<String>(name);
    map['original_language'] = Variable<String>(originalLanguage);
    map['original_name'] = Variable<String>(originalName);
    map['overview'] = Variable<String>(overview);
    map['poster_path'] = Variable<String>(posterPath);
    map['vote_average'] = Variable<String>(voteAverage);
    map['vote_count'] = Variable<int>(voteCount);
    return map;
  }

  TvShowFavoriteEntityCompanion toCompanion(bool nullToAbsent) {
    return TvShowFavoriteEntityCompanion(
      id: Value(id),
      backdropPath: Value(backdropPath),
      firstAirDate: Value(firstAirDate),
      name: Value(name),
      originalLanguage: Value(originalLanguage),
      originalName: Value(originalName),
      overview: Value(overview),
      posterPath: Value(posterPath),
      voteAverage: Value(voteAverage),
      voteCount: Value(voteCount),
    );
  }

  factory TvShowFavoriteEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TvShowFavoriteEntityData(
      id: serializer.fromJson<int>(json['id']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      firstAirDate: serializer.fromJson<String>(json['firstAirDate']),
      name: serializer.fromJson<String>(json['name']),
      originalLanguage: serializer.fromJson<String>(json['originalLanguage']),
      originalName: serializer.fromJson<String>(json['originalName']),
      overview: serializer.fromJson<String>(json['overview']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      voteAverage: serializer.fromJson<String>(json['voteAverage']),
      voteCount: serializer.fromJson<int>(json['voteCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'firstAirDate': serializer.toJson<String>(firstAirDate),
      'name': serializer.toJson<String>(name),
      'originalLanguage': serializer.toJson<String>(originalLanguage),
      'originalName': serializer.toJson<String>(originalName),
      'overview': serializer.toJson<String>(overview),
      'posterPath': serializer.toJson<String>(posterPath),
      'voteAverage': serializer.toJson<String>(voteAverage),
      'voteCount': serializer.toJson<int>(voteCount),
    };
  }

  TvShowFavoriteEntityData copyWith(
          {int? id,
          String? backdropPath,
          String? firstAirDate,
          String? name,
          String? originalLanguage,
          String? originalName,
          String? overview,
          String? posterPath,
          String? voteAverage,
          int? voteCount}) =>
      TvShowFavoriteEntityData(
        id: id ?? this.id,
        backdropPath: backdropPath ?? this.backdropPath,
        firstAirDate: firstAirDate ?? this.firstAirDate,
        name: name ?? this.name,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalName: originalName ?? this.originalName,
        overview: overview ?? this.overview,
        posterPath: posterPath ?? this.posterPath,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );
  @override
  String toString() {
    return (StringBuffer('TvShowFavoriteEntityData(')
          ..write('id: $id, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('firstAirDate: $firstAirDate, ')
          ..write('name: $name, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalName: $originalName, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      backdropPath,
      firstAirDate,
      name,
      originalLanguage,
      originalName,
      overview,
      posterPath,
      voteAverage,
      voteCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TvShowFavoriteEntityData &&
          other.id == this.id &&
          other.backdropPath == this.backdropPath &&
          other.firstAirDate == this.firstAirDate &&
          other.name == this.name &&
          other.originalLanguage == this.originalLanguage &&
          other.originalName == this.originalName &&
          other.overview == this.overview &&
          other.posterPath == this.posterPath &&
          other.voteAverage == this.voteAverage &&
          other.voteCount == this.voteCount);
}

class TvShowFavoriteEntityCompanion
    extends UpdateCompanion<TvShowFavoriteEntityData> {
  final Value<int> id;
  final Value<String> backdropPath;
  final Value<String> firstAirDate;
  final Value<String> name;
  final Value<String> originalLanguage;
  final Value<String> originalName;
  final Value<String> overview;
  final Value<String> posterPath;
  final Value<String> voteAverage;
  final Value<int> voteCount;
  const TvShowFavoriteEntityCompanion({
    this.id = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.firstAirDate = const Value.absent(),
    this.name = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originalName = const Value.absent(),
    this.overview = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
  });
  TvShowFavoriteEntityCompanion.insert({
    this.id = const Value.absent(),
    required String backdropPath,
    required String firstAirDate,
    required String name,
    required String originalLanguage,
    required String originalName,
    required String overview,
    required String posterPath,
    required String voteAverage,
    required int voteCount,
  })  : backdropPath = Value(backdropPath),
        firstAirDate = Value(firstAirDate),
        name = Value(name),
        originalLanguage = Value(originalLanguage),
        originalName = Value(originalName),
        overview = Value(overview),
        posterPath = Value(posterPath),
        voteAverage = Value(voteAverage),
        voteCount = Value(voteCount);
  static Insertable<TvShowFavoriteEntityData> custom({
    Expression<int>? id,
    Expression<String>? backdropPath,
    Expression<String>? firstAirDate,
    Expression<String>? name,
    Expression<String>? originalLanguage,
    Expression<String>? originalName,
    Expression<String>? overview,
    Expression<String>? posterPath,
    Expression<String>? voteAverage,
    Expression<int>? voteCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (firstAirDate != null) 'first_air_date': firstAirDate,
      if (name != null) 'name': name,
      if (originalLanguage != null) 'original_language': originalLanguage,
      if (originalName != null) 'original_name': originalName,
      if (overview != null) 'overview': overview,
      if (posterPath != null) 'poster_path': posterPath,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (voteCount != null) 'vote_count': voteCount,
    });
  }

  TvShowFavoriteEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? backdropPath,
      Value<String>? firstAirDate,
      Value<String>? name,
      Value<String>? originalLanguage,
      Value<String>? originalName,
      Value<String>? overview,
      Value<String>? posterPath,
      Value<String>? voteAverage,
      Value<int>? voteCount}) {
    return TvShowFavoriteEntityCompanion(
      id: id ?? this.id,
      backdropPath: backdropPath ?? this.backdropPath,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      name: name ?? this.name,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalName: originalName ?? this.originalName,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (firstAirDate.present) {
      map['first_air_date'] = Variable<String>(firstAirDate.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (originalLanguage.present) {
      map['original_language'] = Variable<String>(originalLanguage.value);
    }
    if (originalName.present) {
      map['original_name'] = Variable<String>(originalName.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
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
    return (StringBuffer('TvShowFavoriteEntityCompanion(')
          ..write('id: $id, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('firstAirDate: $firstAirDate, ')
          ..write('name: $name, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalName: $originalName, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount')
          ..write(')'))
        .toString();
  }
}

class $TvShowFavoriteEntityTable extends TvShowFavoriteEntity
    with TableInfo<$TvShowFavoriteEntityTable, TvShowFavoriteEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TvShowFavoriteEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _firstAirDateMeta =
      const VerificationMeta('firstAirDate');
  @override
  late final GeneratedColumn<String> firstAirDate = GeneratedColumn<String>(
      'first_air_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _originalLanguageMeta =
      const VerificationMeta('originalLanguage');
  @override
  late final GeneratedColumn<String> originalLanguage = GeneratedColumn<String>(
      'original_language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _originalNameMeta =
      const VerificationMeta('originalName');
  @override
  late final GeneratedColumn<String> originalName = GeneratedColumn<String>(
      'original_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<String> voteAverage = GeneratedColumn<String>(
      'vote_average', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  @override
  late final GeneratedColumn<int> voteCount = GeneratedColumn<int>(
      'vote_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        backdropPath,
        firstAirDate,
        name,
        originalLanguage,
        originalName,
        overview,
        posterPath,
        voteAverage,
        voteCount
      ];
  @override
  String get aliasedName => _alias ?? 'tv_show_favorite_entity';
  @override
  String get actualTableName => 'tv_show_favorite_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<TvShowFavoriteEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('first_air_date')) {
      context.handle(
          _firstAirDateMeta,
          firstAirDate.isAcceptableOrUnknown(
              data['first_air_date']!, _firstAirDateMeta));
    } else if (isInserting) {
      context.missing(_firstAirDateMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('original_language')) {
      context.handle(
          _originalLanguageMeta,
          originalLanguage.isAcceptableOrUnknown(
              data['original_language']!, _originalLanguageMeta));
    } else if (isInserting) {
      context.missing(_originalLanguageMeta);
    }
    if (data.containsKey('original_name')) {
      context.handle(
          _originalNameMeta,
          originalName.isAcceptableOrUnknown(
              data['original_name']!, _originalNameMeta));
    } else if (isInserting) {
      context.missing(_originalNameMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TvShowFavoriteEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TvShowFavoriteEntityData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      backdropPath: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path'])!,
      firstAirDate: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}first_air_date'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      originalLanguage: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}original_language'])!,
      originalName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}original_name'])!,
      overview: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      posterPath: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path'])!,
      voteAverage: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}vote_average'])!,
      voteCount: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}vote_count'])!,
    );
  }

  @override
  $TvShowFavoriteEntityTable createAlias(String alias) {
    return $TvShowFavoriteEntityTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MovieFavoriteEntityTable movieFavoriteEntity =
      $MovieFavoriteEntityTable(this);
  late final $TvShowFavoriteEntityTable tvShowFavoriteEntity =
      $TvShowFavoriteEntityTable(this);
  late final MovieFavoriteDao movieFavoriteDao =
      MovieFavoriteDao(this as AppDatabase);
  late final TvShowFavoriteDao tvShowFavoriteDao =
      TvShowFavoriteDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [movieFavoriteEntity, tvShowFavoriteEntity];
}
