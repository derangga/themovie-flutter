import 'dart:convert';

import 'package:core/core.dart';

class MoviesDTO {
  int page;
  List<MovieDTO> results;
  int totalPages;
  int totalResults;

  MoviesDTO({this.page, this.results, this.totalPages, this.totalResults});

  MoviesDTO.fromJson(dynamic data) {
    var json = jsonDecode(data);
    page = json['page'];
    if (json['results'] != null) {
      results = List<MovieDTO>();
      json['results'].forEach((v) {
        results.add(MovieDTO.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class Movies {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  Movies({this.page, this.results, this.totalPages, this.totalResults});
}

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
      this.voteCount});

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
