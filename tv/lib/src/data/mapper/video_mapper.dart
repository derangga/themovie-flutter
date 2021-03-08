import 'package:tv/src/data/model/videos.dart';
import 'package:core/core.dart';

extension VideoDTOExtension on VideoDTO {
  Video toModel() {
    return Video(
        id: this.id.orEmpty(),
        key: this.key.orEmpty(),
        name: this.name.orEmpty(),
        site: this.site.orEmpty(),
        size: this.size.orZero(),
        type: this.type.orEmpty());
  }
}

extension VideoExtension on Video {
  Video orEmpty() {
    return this ??
        Video(id: "", key: "", name: "", site: "", size: 0, type: "");
  }
}
