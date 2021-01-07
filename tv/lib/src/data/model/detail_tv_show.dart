import 'package:core/core.dart';

class DetailTvShowDTO {
  String backdropPath;
  String firstAirDate;
  List<GenreDTO> genres;
  String homepage;
  int id;
  bool inProduction;
  String lastAirDate;
  String name;
  int numberOfEpisodes;
  int numberOfSeasons;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  List<SeasonDTO> seasons;
  String status;
  String tagline;
  String type;
  String voteAverage;
  int voteCount;

  DetailTvShowDTO(
      {this.backdropPath,
      this.firstAirDate,
      this.genres,
      this.homepage,
      this.id,
      this.inProduction,
      this.lastAirDate,
      this.name,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.seasons,
      this.status,
      this.tagline,
      this.type,
      this.voteAverage,
      this.voteCount});

  DetailTvShowDTO.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    firstAirDate = json['first_air_date'];
    if (json['genres'] != null) {
      genres = new List<GenreDTO>();
      json['genres'].forEach((v) {
        genres.add(GenreDTO.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    inProduction = json['in_production'];
    lastAirDate = json['last_air_date'];
    name = json['name'];
    numberOfEpisodes = json['number_of_episodes'];
    numberOfSeasons = json['number_of_seasons'];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['seasons'] != null) {
      seasons = List<SeasonDTO>();
      json['seasons'].forEach((v) {
        seasons.add(SeasonDTO.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    type = json['type'];
    voteAverage = '${json['vote_average']}';
    voteCount = json['vote_count'];
  }
}

class GenreDTO {
  int id;
  String name;

  GenreDTO({this.id, this.name});

  GenreDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class SeasonDTO {
  String airDate;
  int episodeCount;
  int id;
  String name;
  String overview;
  String posterPath;
  int seasonNumber;

  SeasonDTO(
      {this.airDate,
      this.episodeCount,
      this.id,
      this.name,
      this.overview,
      this.posterPath,
      this.seasonNumber});

  SeasonDTO.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeCount = json['episode_count'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    seasonNumber = json['season_number'];
  }
}

class DetailTvShow extends Equatable {
  final String backdropPath;
  final String firstAirDate;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final String lastAirDate;
  final String name;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<Season> seasons;
  final String status;
  final String tagline;
  final String type;
  final String voteAverage;
  final int voteCount;

  DetailTvShow(
      {this.backdropPath,
      this.firstAirDate,
      this.genres,
      this.homepage,
      this.id,
      this.inProduction,
      this.lastAirDate,
      this.name,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.seasons,
      this.status,
      this.tagline,
      this.type,
      this.voteAverage,
      this.voteCount})
      : assert(backdropPath != null),
        assert(firstAirDate != null),
        assert(genres != null),
        assert(homepage != null),
        assert(id != null),
        assert(inProduction != null),
        assert(lastAirDate != null),
        assert(name != null),
        assert(numberOfEpisodes != null),
        assert(numberOfSeasons != null),
        assert(originalLanguage != null),
        assert(originalName != null),
        assert(overview != null),
        assert(popularity != null),
        assert(posterPath != null),
        assert(seasons != null),
        assert(status != null),
        assert(tagline != null),
        assert(type != null),
        assert(voteAverage != null),
        assert(voteCount != null);

  @override
  List<Object> get props => [
        backdropPath,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        lastAirDate,
        name,
        numberOfEpisodes,
        numberOfSeasons,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        seasons,
        status,
        tagline,
        type,
        voteAverage,
        voteCount
      ];
}

class Genre extends Equatable {
  final int id;
  final String name;

  Genre({this.id, this.name})
      : assert(id != null),
        assert(name != null);

  @override
  List<Object> get props => [id, name];
}

class Season extends Equatable {
  final String airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final int seasonNumber;

  Season(
      {this.airDate,
      this.episodeCount,
      this.id,
      this.name,
      this.overview,
      this.posterPath,
      this.seasonNumber})
      : assert(airDate != null),
        assert(episodeCount != null),
        assert(id != null),
        assert(name != null),
        assert(overview != null),
        assert(posterPath != null),
        assert(seasonNumber != null);

  @override
  List<Object> get props =>
      [airDate, episodeCount, id, name, overview, posterPath, seasonNumber];
}
