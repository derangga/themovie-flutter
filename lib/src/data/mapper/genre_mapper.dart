import '../model/genre.dart';

extension GenresDTOExtension on GenresDTO? {
  List<Genre> toModel() {
    final genres = this?.genres ?? [];
    return genres.map((e) => e.toModel()).toList();
  }
}

extension GenreDTOExtension on GenreDTO? {
  Genre toModel() {
    return Genre(
      id: this?.id ?? 0,
      name: this?.name ?? '',
    );
  }
}
