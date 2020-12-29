import 'package:movie/src/data/model/detail_movie.dart';
import 'package:core/core.dart';

extension GenreDTOMapper on GenresDTO {
  Genres toModel() {
    return Genres(id: this.id.orZero(), name: this.name.orEmpty());
  }
}
