import 'package:sweetsd_github/data/action.dart';
import 'package:sweetsd_github/data/media.dart';

class Project {
  String? name;
  String? imageUrl;
  String? description;
  List<ActionInfo>? actions;
  List<MediaInfo>? media;

  Project(
      {this.name, this.description, this.imageUrl, this.actions, this.media});

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        name: json['name'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        actions: json['actions'] != null
            ? (json['actions'] as Iterable)
                .map((e) => ActionInfo.fromJson(e))
                .toList()
            : [],
        media: json['media'] != null
            ? (json['media'] as Iterable)
                .map((e) => MediaInfo.fromJson(e))
                .toList()
            : [],
      );
}
