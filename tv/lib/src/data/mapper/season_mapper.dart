import 'package:tv/src/data/model/detail_tv_show.dart';
import 'package:core/core.dart';

extension SeasonDTOExtension on SeasonDTO {
  Season toModel() {
    return Season(
        airDate: this.airDate.orEmpty(),
        episodeCount: this.episodeCount.orZero(),
        id: this.id.orZero(),
        name: this.name.orEmpty(),
        overview: this.overview.orEmpty(),
        posterPath: this.posterPath.orEmpty(),
        seasonNumber: this.seasonNumber.orZero());
  }
}
