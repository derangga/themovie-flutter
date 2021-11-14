import '../model/videos.dart';

extension VideoDTOExtension on VideoDTO? {
  Video toModel() {
    return Video(
      id: this?.id ?? '',
      key: this?.key ?? '',
      name: this?.name ?? '',
      site: this?.site ?? '',
      size: this?.size ?? 0,
      type: this?.type ?? '',
    );
  }
}

extension VideoExtension on Video? {
  Video orEmpty() {
    return this ??
        Video(
          id: "",
          key: "",
          name: "",
          site: "",
          size: 0,
          type: "",
        );
  }
}
