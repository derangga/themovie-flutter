import '../../data/model/genre.dart';

class DetailMovieDTO {
  bool adult;
  String backdropPath;
  int budget;
  List<GenreDTO> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String status;
  String tagline;
  String title;
  String releaseDate;
  bool video;
  double voteAverage;
  int voteCount;

  DetailMovieDTO(
      {this.adult,
      this.backdropPath,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.status,
      this.tagline,
      this.title,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount});

  DetailMovieDTO.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = new List<GenreDTO>();
      json['genres'].forEach((v) {
        genres.add(new GenreDTO.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}

class DetailMovie {
  bool adult;
  String backdropPath;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String status;
  String tagline;
  String title;
  String releaseDate;
  bool video;
  double voteAverage;
  int voteCount;

  DetailMovie(
      {this.adult,
      this.backdropPath,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.status,
      this.tagline,
      this.title,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount});
}
