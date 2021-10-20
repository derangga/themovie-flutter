import 'package:equatable/equatable.dart';
import 'package:moor_flutter/moor_flutter.dart';

class MovieDTO {
  bool adult;
  String backdropPath;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  String voteAverage;
  int voteCount;

  MovieDTO(
      {this.adult,
      this.backdropPath,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  MovieDTO.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = '${json['vote_average']}';
    voteCount = json['vote_count'];
  }
}

class Movie extends Equatable {
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

  Movie(
      {this.adult,
      this.backdropPath,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount})
      : assert(adult != null),
        assert(backdropPath != null),
        assert(id != null),
        assert(originalLanguage != null),
        assert(originalTitle != null),
        assert(overview != null),
        assert(popularity != null),
        assert(posterPath != null),
        assert(releaseDate != null),
        assert(title != null),
        assert(video != null),
        assert(voteAverage != null),
        assert(voteCount != null);

  @override
  List<Object> get props => [
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
}

class MovieEntity extends Table {
  BoolColumn get adult => boolean()();
  TextColumn get backdropPath => text()();
  IntColumn get id => integer()();
  TextColumn get originalLanguage => text()();
  TextColumn get originalTitle => text()();
  TextColumn get overview => text()();
  RealColumn get popularity => real()();
  TextColumn get posterPath => text()();
  TextColumn get releaseDate => text()();
  TextColumn get title => text()();
  BoolColumn get video => boolean()();
  TextColumn get voteAverage => text()();
  IntColumn get voteCount => integer()();
}
