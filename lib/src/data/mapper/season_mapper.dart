import '../model/detail_tv_show.dart';
import '../../utils/extension/string_utils.dart';
import '../../utils/extension/number_utils.dart';

extension SeasonDTOExtension on SeasonDTO {
  Season toModel() {
    return Season(
      airDate: this.airDate!.orEmpty(),
      episodeCount: this.episodeCount.orZero(),
      id: this.id.orZero(),
      name: this.name.orEmpty(),
      overview: this.overview.orEmpty(),
      posterPath: this.posterPath.orEmpty(),
      seasonNumber: this.seasonNumber.orZero(),
    );
  }
}
