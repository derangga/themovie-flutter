class VideoDTO {
  String? id;
  String? key;
  String? name;
  String? site;
  int? size;
  String? type;

  VideoDTO({this.id, this.key, this.name, this.site, this.size, this.type});

  VideoDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
  }
}

class Video {
  final String id;
  final String key;
  final String name;
  final String site;
  final int size;
  final String type;

  Video({
    required this.id,
    required this.key,
    required this.name,
    required this.site,
    required this.size,
    required this.type,
  });
}
