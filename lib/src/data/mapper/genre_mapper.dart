import '../model/genre.dart';
import '../../data/local/db/genre_db.dart';
import '../../utils/extension/list_utils.dart';
import '../../utils/extension/number_utils.dart';
import '../../utils/extension/string_utils.dart';

extension ListGenreDTOExtension on ListGenreDTO<List<GenreDTO>> {
  ListGenre<List<Genre>> toGenreModelPaging() {
    return ListGenre(
      data: this.data.orEmpty().map((e) => e.toModel()).toList(),
    );
  }
}

extension GenreDTOExtension on GenreDTO {
  Genre toModel() {
    return Genre(id: this.id.orZero(), name: this.name!.orEmpty());
  }

  // GenreMovieEntityData toEntity() {
  //   return GenreMovieEntityData(id: this.id, name: this.name);
  // }
}

extension GenreEntityExtension on GenreMovieEntityData {
  Genre toModel() {
    return Genre(id: this.id.orZero(), name: this.name.orEmpty());
  }
}

extension GenreMovieExtension on Genre {
  // GenreMovieEntityData toEntity() {
  //   return GenreMovieEntityData(id: this.id, name: this.name);
  // }
}
