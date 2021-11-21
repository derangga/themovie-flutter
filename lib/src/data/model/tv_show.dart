import 'package:equatable/equatable.dart';

class TvShowDTO {
  String? backdropPath;
  String? firstAirDate;
  int? id;
  String? name;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? posterPath;
  String? voteAverage;
  int? voteCount;

  TvShowDTO({
    this.backdropPath,
    this.firstAirDate,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  TvShowDTO.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    firstAirDate = json['first_air_date'];
    id = json['id'];
    name = json['name'];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    voteAverage = '${json['vote_average']}';
    voteCount = json['vote_count'];
  }
}

class TvShow extends Equatable {
  final String backdropPath;
  final String firstAirDate;
  final int id;
  final String name;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final String posterPath;
  final String voteAverage;
  final int voteCount;

  TvShow(
      {required this.backdropPath,
      required this.firstAirDate,
      required this.id,
      required this.name,
      required this.originalLanguage,
      required this.originalName,
      required this.overview,
      required this.posterPath,
      required this.voteAverage,
      required this.voteCount});

  @override
  List<Object> get props => [
        backdropPath,
        firstAirDate,
        id,
        name,
        originalLanguage,
        originalName,
        overview,
        posterPath,
        voteAverage,
        voteCount
      ];
}
