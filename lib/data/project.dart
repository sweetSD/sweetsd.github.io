import 'package:sweetsd_github/data/media.dart';

class Project {
  String? name;
  String? imageUrl;
  String? description;
  List<MediaInfo>? media;

  Project({this.name, this.description, this.imageUrl, this.media});

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        name: json['name'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        media: (json['media'] as Iterable)
            .map((e) => MediaInfo.fromJson(e))
            .toList(),
      );
}
