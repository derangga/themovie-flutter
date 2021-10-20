import '../model/videos.dart';
import '../../utils/extension/string_utils.dart';
import '../../utils/extension/number_utils.dart';

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
