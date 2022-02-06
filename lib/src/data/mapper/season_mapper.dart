import '../model/detail_tv_show.dart';

extension SeasonDTOExtension on SeasonDTO? {
  Season toModel() {
    return Season(
      airDate: this?.airDate ?? '',
      episodeCount: this?.episodeCount ?? 0,
      id: this?.id ?? 0,
      name: this?.name ?? '',
      overview: this?.overview ?? '',
      posterPath: this?.posterPath ?? '',
      seasonNumber: this?.seasonNumber ?? 0,
    );
  }
}
