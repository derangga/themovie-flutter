import 'package:equatable/equatable.dart';
import 'package:moor_flutter/moor_flutter.dart';

typedef ArrayParser<T> = T Function(List<dynamic>? jsonArray);
typedef Parser<T> = T Function(dynamic json);

class ListGenreDTO<T> {
  late T data;

  ListGenreDTO.fromJsonArray(
      Map<String, dynamic> json, ArrayParser<T> parserArray) {
    data = parserArray(json['results']);
  }

  ListGenreDTO.fromJsonObject(Map<String, dynamic> json, Parser<T> parser) {
    data = parser(json['results']);
  }
}

class ListGenre<T> {
  T data;

  ListGenre({required this.data}) : assert(data != null);
}

class GenreDTO {
  int? id;
  String? name;

  GenreDTO({this.id, this.name});

  GenreDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Genre extends Equatable {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}

class GenreMovieEntity extends Table {
  IntColumn? get id => integer()();
  TextColumn? get name => text()();
}
