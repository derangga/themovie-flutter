import 'package:equatable/equatable.dart';

class CastAndCrewDTO {
  List<CastDTO> castDto;
  int id;

  CastAndCrewDTO({this.castDto, this.id});

  CastAndCrewDTO.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      castDto = List<CastDTO>();
      json['cast'].forEach((v) {
        castDto.add(CastDTO.fromJson(v));
      });
    }
    id = json['id'];
  }
}

class CastDTO {
  int id;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  String character;
  String creditId;

  CastDTO(
      {this.id,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.character,
      this.creditId});

  CastDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    character = json['character'];
    creditId = json['credit_id'];
  }
}

class Cast extends Equatable {
  final int id;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final String character;
  final String creditId;

  Cast(
      {this.id,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.character,
      this.creditId})
      : assert(id != null),
        assert(name != null),
        assert(originalName != null),
        assert(popularity != null),
        assert(profilePath != null),
        assert(character != null),
        assert(creditId != null);

  @override
  List<Object> get props =>
      [id, name, originalName, popularity, profilePath, character, creditId];
}
