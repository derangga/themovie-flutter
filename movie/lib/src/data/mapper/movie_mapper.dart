import 'package:core/core.dart';
import 'genre_mapper.dart';
import '../local/db/movie_db.dart';
import '../model/detail_movie.dart';
import '../model/movie.dart';

extension MoviesDTOExtension on MoviesDTO {
  Movies toModel() {
    return Movies(
        page: this.page.orZero(),
        results: this.results.orEmpty().map((e) => e.toModel()).toList(),
        totalPages: this.totalPages.orZero(),
        totalResults: this.totalResults.orZero());
  }
}

extension MovieDTOExtension on MovieDTO {
  Movie toModel() {
    return Movie(
        adult: this.adult ?? false,
        backdropPath: this.backdropPath.orEmpty(),
        id: this.id.orZero(),
        originalLanguage: this.originalLanguage.orEmpty(),
        originalTitle: this.originalTitle.orEmpty(),
        overview: this.overview.orEmpty(),
        popularity: this.popularity.orZero(),
        posterPath: this.posterPath.orEmpty(),
        releaseDate: this.releaseDate.orEmpty(),
        title: this.title.orEmpty(),
        video: this.video ?? false,
        voteAverage: this.voteAverage.orEmpty(),
        voteCount: this.voteCount.orZero());
  }

  MovieEntityData toEntity() {
    return MovieEntityData(
        adult: this.adult,
        backdropPath: this.backdropPath,
        id: this.id,
        originalLanguage: this.originalLanguage,
        originalTitle: this.originalTitle,
        overview: this.overview,
        popularity: this.popularity,
        posterPath: this.posterPath,
        releaseDate: this.releaseDate,
        title: this.title,
        video: this.video,
        voteAverage: this.voteAverage,
        voteCount: this.voteCount);
  }
}

extension MovieEntityExtension on MovieEntityData {
  Movie toModel() {
    return Movie(
        adult: this.adult ?? false,
        backdropPath: this.backdropPath.orEmpty(),
        id: this.id.orZero(),
        originalLanguage: this.originalLanguage.orEmpty(),
        originalTitle: this.originalTitle.orEmpty(),
        overview: this.overview.orEmpty(),
        popularity: this.popularity.orZero(),
        posterPath: this.posterPath.orEmpty(),
        releaseDate: this.releaseDate.orEmpty(),
        title: this.title.orEmpty(),
        video: this.video ?? false,
        voteAverage: this.voteAverage.orEmpty(),
        voteCount: this.voteCount.orZero());
  }
}

extension MovieExtension on Movie {
  Movie orEmpty() {
    return this != null
        ? this
        : Movie(
            adult: false,
            backdropPath: '',
            id: 0,
            originalLanguage: '',
            originalTitle: '',
            overview: '',
            popularity: 0.0,
            posterPath: '',
            releaseDate: '',
            title: '',
            video: false,
            voteAverage: '',
            voteCount: 0);
  }

  MovieEntityData toEntity() {
    return MovieEntityData(
        adult: this.adult,
        backdropPath: this.backdropPath,
        id: this.id,
        originalLanguage: this.originalLanguage,
        originalTitle: this.originalTitle,
        overview: this.overview,
        popularity: this.popularity,
        posterPath: this.posterPath,
        releaseDate: this.releaseDate,
        title: this.title,
        video: this.video,
        voteAverage: this.voteAverage,
        voteCount: this.voteCount);
  }
}

extension DetailMovieDTOExtension on DetailMovieDTO {
  DetailMovie toModel() {
    return DetailMovie(
        adult: this.adult ?? false,
        backdropPath: this.backdropPath.orEmpty(),
        budget: this.budget.orZero(),
        genres: this.genres.orEmpty().map((e) => e.toModel()).toList(),
        homepage: this.homepage.orEmpty(),
        id: this.id.orZero(),
        imdbId: this.imdbId.orEmpty(),
        originalLanguage: this.originalLanguage.orEmpty(),
        originalTitle: this.originalTitle.orEmpty(),
        overview: this.overview.orEmpty(),
        popularity: this.popularity.orZero(),
        posterPath: this.posterPath.orEmpty(),
        status: this.status.orEmpty(),
        tagline: this.tagline.orEmpty(),
        title: this.title.orEmpty(),
        video: this.video ?? false,
        voteAverage: this.voteAverage.orZero(),
        voteCount: this.voteCount.orZero());
  }
}

extension DetailMovieExtension on DetailMovie {
  DetailMovie orEmpty() {
    return this != null
        ? this
        : DetailMovie(
            adult: false,
            backdropPath: '',
            budget: 0,
            genres: [],
            homepage: '',
            id: 0,
            imdbId: '',
            originalLanguage: '',
            originalTitle: '',
            overview: '',
            popularity: 0,
            posterPath: '',
            status: '',
            tagline: '',
            title: '',
            video: false,
            voteAverage: 0,
            voteCount: 0);
  }
}
