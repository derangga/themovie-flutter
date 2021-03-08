import 'package:core/core.dart';

class TvShowDTO {
  String backdropPath;
  String firstAirDate;
  int id;
  String name;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  String voteAverage;
  int voteCount;

  TvShowDTO(
      {this.backdropPath,
      this.firstAirDate,
      this.id,
      this.name,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.voteAverage,
      this.voteCount});

  TvShowDTO.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    firstAirDate = json['first_air_date'];
    id = json['id'];
    name = json['name'];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
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
  final double popularity;
  final String posterPath;
  final String voteAverage;
  final int voteCount;

  TvShow(
      {this.backdropPath,
      this.firstAirDate,
      this.id,
      this.name,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.voteAverage,
      this.voteCount})
      : assert(backdropPath != null),
        assert(firstAirDate != null),
        assert(id != null),
        assert(name != null),
        assert(originalLanguage != null),
        assert(originalName != null),
        assert(overview != null),
        assert(popularity != null),
        assert(posterPath != null),
        assert(voteAverage != null),
        assert(voteCount != null);

  @override
  List<Object> get props => [
        backdropPath,
        firstAirDate,
        id,
        name,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        voteAverage,
        voteCount
      ];
}
