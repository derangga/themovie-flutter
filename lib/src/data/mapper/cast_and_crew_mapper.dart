import '../model/cast_and_crew.dart';

extension CastDTOExtension on CastDTO? {
  Cast toModel() {
    return Cast(
      character: this?.character ?? '',
      creditId: this?.creditId ?? '',
      id: this?.id ?? 0,
      name: this?.name ?? '',
      originalName: this?.originalName ?? '',
      popularity: this?.popularity ?? 0,
      profilePath: this?.profilePath ?? '',
    );
  }
}

extension CastExtension on Cast? {
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
