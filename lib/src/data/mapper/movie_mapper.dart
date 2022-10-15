import '../local/db/app_database.dart';
import '../wrapper/paging_dto.dart';
import '../model/detail_movie.dart';
import '../model/movie.dart';
import 'genre_mapper.dart';

extension PagingMovieDTOExtension on PagingDTO<List<MovieDTO?>?>? {
  PagingModel<List<Movie>> toModelPaging() {
    List<MovieDTO?> tempList = this?.data ?? [];
    return PagingModel(
        data: tempList.map((e) => e.toModel()).toList(),
        page: this?.page ?? 0,
        totalPage: this?.totalPage ?? 0,
        totalResults: this?.totalResults ?? 0);
  }
}

extension MovieDTOExtension on MovieDTO? {
  Movie toModel() {
    return Movie(
        adult: this?.adult ?? false,
        backdropPath: this?.backdropPath ?? '',
        id: this?.id ?? 0,
        originalLanguage: this?.originalLanguage ?? '',
        originalTitle: this?.originalTitle ?? '',
        overview: this?.overview ?? '',
        popularity: this?.popularity ?? 0,
        posterPath: this?.posterPath ?? '',
        releaseDate: this?.releaseDate ?? '',
        title: this?.title ?? '',
        video: this?.video ?? false,
        voteAverage: this?.voteAverage ?? '',
        voteCount: this?.voteCount ?? 0);
  }

  MovieFavoriteEntityData toEntity() {
    return MovieFavoriteEntityData(
      adult: this?.adult ?? false,
      backdropPath: this?.backdropPath ?? '',
      id: this?.id ?? 0,
      originalLanguage: this?.originalLanguage ?? '',
      originalTitle: this?.originalTitle ?? '',
      overview: this?.overview ?? '',
      popularity: this?.popularity ?? 0.0,
      posterPath: this?.posterPath ?? '',
      releaseDate: this?.releaseDate ?? '',
      title: this?.title ?? '',
      video: this?.video ?? false,
      voteAverage: this?.voteAverage ?? '',
      voteCount: this?.voteCount ?? 0,
    );
  }
}

extension MovieFavoriteEntityExtension on MovieFavoriteEntityData? {
  Movie? toModel() {
    if (this != null) {
      return Movie(
          adult: this?.adult ?? false,
          backdropPath: this?.backdropPath ?? '',
          id: this?.id ?? 0,
          originalLanguage: this?.originalLanguage ?? '',
          originalTitle: this?.originalTitle ?? '',
          overview: this?.overview ?? '',
          popularity: this?.popularity ?? 0,
          posterPath: this?.posterPath ?? '',
          releaseDate: this?.releaseDate ?? '',
          title: this?.title ?? '',
          video: this?.video ?? false,
          voteAverage: this?.voteAverage ?? '',
          voteCount: this?.voteCount ?? 0);
    } else {
      return null;
    }
  }
}

extension MovieFavoriteExtension on Movie {
  MovieFavoriteEntityData toEntity() {
    return MovieFavoriteEntityData(
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
      voteCount: this.voteCount,
    );
  }
}

extension DetailMovieDTOExtension on DetailMovieDTO? {
  DetailMovie toModel() {
    final tempGenre = this?.genres ?? [];
    return DetailMovie(
      adult: this?.adult ?? false,
      backdropPath: this?.backdropPath ?? '',
      budget: this?.budget ?? 0,
      genres: tempGenre.map((e) => e.toModel()).toList(),
      homepage: this?.homepage ?? '',
      id: this?.id ?? 0,
      imdbId: this?.imdbId ?? '',
      originalLanguage: this?.originalLanguage ?? '',
      originalTitle: this?.originalTitle ?? '',
      overview: this?.overview ?? '',
      popularity: this?.popularity ?? 0,
      posterPath: this?.posterPath ?? '',
      status: this?.status ?? '',
      tagline: this?.tagline ?? '',
      title: this?.title ?? '',
      releaseDate: this?.releaseDate ?? '',
      video: this?.video ?? false,
      voteAverage: this?.voteAverage ?? 0.0,
      voteCount: this?.voteCount ?? 0,
    );
  }
}

extension DetailMovieExtension on DetailMovie? {
  DetailMovie orEmpty() {
    return this ??
        DetailMovie(
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
            releaseDate: "",
            video: false,
            voteAverage: 0,
            voteCount: 0);
  }
}
