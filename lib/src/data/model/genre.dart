import 'package:equatable/equatable.dart';
import 'package:moor_flutter/moor_flutter.dart';

typedef ArrayParser<T> = T Function(List<dynamic>? jsonArray);
typedef Parser<T> = T Function(dynamic json);

class GenresDTO {
  List<GenreDTO>? genres;

  GenresDTO({this.genres});

  GenresDTO.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <GenreDTO>[];
      json['genres'].forEach((v) {
        genres!.add(new GenreDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GenreDTO {
  int? id;
  String? name;

  GenreDTO({this.id, this.name});

  GenreDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
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
