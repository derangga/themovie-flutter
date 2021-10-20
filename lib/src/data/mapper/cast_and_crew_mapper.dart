import '../model/cast_and_crew.dart';
import '../../utils/extension/string_utils.dart';
import '../../utils/extension/number_utils.dart';

extension CastDTOExtension on CastDTO {
  Cast toModel() {
    return Cast(
      character: this.character.orEmpty(),
      creditId: this.creditId.orEmpty(),
      id: this.id.orZero(),
      name: this.name.orEmpty(),
      originalName: this.originalName.orEmpty(),
      popularity: this.popularity.orZero(),
      profilePath: this.profilePath.orEmpty(),
    );
  }
}

extension CastExtension on Cast {
  Cast orEmpty() {
    return this ??
        Cast(
          character: "",
          creditId: "",
          id: 0,
          name: "",
          originalName: "",
          popularity: 0,
          profilePath: "",
        );
  }
}
