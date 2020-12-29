import 'package:core/core.dart';
import 'genre_mapper.dart';
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
        genreIds: this.genreIds.orEmpty(),
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
            genreIds: [],
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
