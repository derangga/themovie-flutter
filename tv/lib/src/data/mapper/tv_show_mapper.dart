import 'package:core/core.dart';
import 'genre_mapper.dart';
import 'season_mapper.dart';
import '../model/detail_tv_show.dart';
import '../model/tv_show.dart';

extension PagingTvShowDTOExtension on PagingDTO<List<TvShowDTO>> {
  PagingModel<List<TvShow>> toModelPaging() {
    return PagingModel(
        data: this.data.map((e) => e.toModel()).toList(),
        page: this.page.orZero(),
        totalPage: this.totalPage.orZero(),
        totalResults: this.totalResults.orZero());
  }
}

extension TvShowDTOExtension on TvShowDTO {
  TvShow toModel() {
    return TvShow(
        id: this.id.orZero(),
        name: this.name.orEmpty(),
        originalName: this.originalName.orEmpty(),
        originalLanguage: this.originalLanguage.orEmpty(),
        backdropPath: this.backdropPath.orEmpty(),
        posterPath: this.posterPath.orEmpty(),
        firstAirDate: this.firstAirDate.orEmpty(),
        overview: this.overview.orEmpty(),
        popularity: this.popularity.orZero(),
        voteAverage: this.voteAverage.orEmpty(),
        voteCount: this.voteCount.orZero());
  }
}

extension TvShowExtension on TvShow {
  TvShow orEmpty() {
    return this ??
        TvShow(
            id: 0,
            name: '',
            originalName: '',
            originalLanguage: '',
            backdropPath: '',
            posterPath: '',
            firstAirDate: '',
            overview: '',
            popularity: 0,
            voteAverage: '',
            voteCount: 0);
  }
}

extension DetailTvShowDTOExtension on DetailTvShowDTO {
  DetailTvShow toModel() {
    return DetailTvShow(
        backdropPath: this.backdropPath.orEmpty(),
        firstAirDate: this.firstAirDate.orEmpty(),
        genres: this.genres.orEmpty().map((e) => e.toModel()).toList(),
        homepage: this.homepage.orEmpty(),
        id: this.id.orZero(),
        inProduction: this.inProduction ?? false,
        lastAirDate: this.lastAirDate.orEmpty(),
        name: this.name.orEmpty(),
        numberOfEpisodes: this.numberOfEpisodes.orZero(),
        numberOfSeasons: this.numberOfSeasons.orZero(),
        originalLanguage: this.originalLanguage.orEmpty(),
        originalName: this.originalName.orEmpty(),
        overview: this.overview.orEmpty(),
        popularity: this.popularity.orZero(),
        posterPath: this.posterPath.orEmpty(),
        seasons: this.seasons.orEmpty().map((e) => e.toModel()).toList(),
        status: this.status.orEmpty(),
        tagline: this.tagline.orEmpty(),
        type: this.type.orEmpty(),
        voteAverage: this.voteAverage.orZero(),
        voteCount: this.voteCount.orZero());
  }
}
