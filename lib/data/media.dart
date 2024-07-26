import 'package:flutter/material.dart';
import 'package:sweetsd_github/widgets/youtube.dart';

enum MediaType {
  video,
  image,
  networkImage;

  String toJson() => name;
  static MediaType fromJson(String json) => values.byName(json);
}

class MediaInfo {
  MediaType type;
  String media;

  Widget createWidget() {
    if (type == MediaType.image) {
      return Image.asset(
        'assets/images/$media',
        fit: BoxFit.cover,
      );
    } else if (type == MediaType.networkImage) {
      return Image.network(
        media,
        fit: BoxFit.cover,
      );
    } else if (type == MediaType.video) {
      return YoutubeContainer(media);
    }
    return Container();
  }

  MediaInfo.fromJson(Map<String, dynamic> json)
      : type = MediaType.fromJson(json['mediaType']),
        media = json['media'];

  Map<String, dynamic> toJson() => {
        'mediaType': type.toJson(),
        'media': media,
      };
}
