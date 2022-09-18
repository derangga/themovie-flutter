class CastAndCrewDTO {
  List<CastDTO>? castDto;
  int? id;

  CastAndCrewDTO({this.castDto, this.id});

  CastAndCrewDTO.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      castDto = List.empty(growable: true);
      json['cast'].forEach((v) {
        castDto!.add(CastDTO.fromJson(v));
      });
    }
    id = json['id'];
  }
}

class CastDTO {
  int? id;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? character;
  String? creditId;

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

class Cast {
  final int id;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final String character;
  final String creditId;

  Cast({
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.character,
    required this.creditId,
  });
}
