import 'package:core/core.dart';
import 'package:tv/src/data/model/cast_and_crew.dart';

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
