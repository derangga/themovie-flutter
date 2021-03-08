import '../model/detail_tv_show.dart';
import 'package:core/core.dart';

extension GenreDTOMapper on GenreDTO {
  Genre toModel() {
    return Genre(id: this.id.orZero(), name: this.name.orEmpty());
  }
}
