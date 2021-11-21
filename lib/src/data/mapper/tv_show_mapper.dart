import 'package:themovie_flutter/src/data/model/genre.dart';

import '../wrapper/paging_dto.dart';
import 'genre_mapper.dart';
import 'season_mapper.dart';
import '../model/detail_tv_show.dart';
import '../model/tv_show.dart';

extension PagingTvShowDTOExtension on PagingDTO<List<TvShowDTO?>?>? {
  PagingModel<List<TvShow>> toModelPaging() {
    List<TvShowDTO?> tempTvShow = this?.data ?? [];
    return PagingModel(
      data: tempTvShow.map((e) => e.toModel()).toList(),
      page: this?.page ?? 0,
      totalPage: this?.totalPage ?? 0,
      totalResults: this?.totalResults ?? 0,
    );
  }
}

extension TvShowDTOExtension on TvShowDTO? {
  TvShow toModel() {
    return TvShow(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      originalName: this?.originalName ?? '',
      originalLanguage: this?.originalLanguage ?? '',
      backdropPath: this?.backdropPath ?? '',
      posterPath: this?.posterPath ?? '',
      firstAirDate: this?.firstAirDate ?? '',
      overview: this?.overview ?? '',
      voteAverage: this?.voteAverage ?? '',
      voteCount: this?.voteCount ?? 0,
    );
  }
}

extension TvShowExtension on TvShow? {
  TvShow orEmpty() {
    return this ??
        TvShow(
          id: 0,
          name: "",
          originalName: "",
          originalLanguage: "",
          backdropPath: "",
          posterPath: "",
          firstAirDate: "",
          overview: "",
          voteAverage: "",
          voteCount: 0,
        );
  }
}

extension DetailTvShowDTOExtension on DetailTvShowDTO? {
  DetailTvShow toModel() {
    List<GenreDTO> tempGenre = this?.genres ?? [];
    List<SeasonDTO> tempSeason = this?.seasons ?? [];
    return DetailTvShow(
      backdropPath: this?.backdropPath ?? '',
      firstAirDate: this?.firstAirDate ?? '',
      genres: tempGenre.map((e) => e.toModel()).toList(),
      homepage: this?.homepage ?? '',
      id: this?.id ?? 0,
      inProduction: this?.inProduction ?? false,
      lastAirDate: this?.lastAirDate ?? '',
      name: this?.name ?? '',
      numberOfEpisodes: this?.numberOfEpisodes ?? 0,
      numberOfSeasons: this?.numberOfSeasons ?? 0,
      originalLanguage: this?.originalLanguage ?? '',
      originalName: this?.originalName ?? '',
      overview: this?.overview ?? '',
      popularity: this?.popularity ?? 0,
      posterPath: this?.posterPath ?? '',
      seasons: tempSeason.map((e) => e.toModel()).toList(),
      status: this?.status ?? '',
      tagline: this?.tagline ?? '',
      type: this?.type ?? '',
      voteAverage: this?.voteAverage ?? '',
      voteCount: this?.voteCount ?? 0,
    );
  }
}

extension DetailTvShowExtension on DetailTvShow? {
  DetailTvShow orEmpty() {
    return this ??
        DetailTvShow(
            backdropPath: "",
            firstAirDate: "",
            genres: [],
            homepage: "",
            id: 0,
            inProduction: false,
            lastAirDate: "",
            name: "",
            numberOfEpisodes: 0,
            numberOfSeasons: 0,
            originalLanguage: "",
            originalName: "",
            overview: "",
            popularity: 0,
            posterPath: "",
            seasons: [],
            status: "",
            tagline: "",
            type: "",
            voteAverage: "",
            voteCount: 0);
  }
}
