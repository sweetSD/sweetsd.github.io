import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeContainer extends StatefulWidget {
  const YoutubeContainer(this.videoId, {super.key});

  final String videoId;

  @override
  State<YoutubeContainer> createState() => _YoutubeContainerState();
}

class _YoutubeContainerState extends State<YoutubeContainer> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return Container();
    }

    return YoutubePlayerIFrame(
      controller: _controller,
      aspectRatio: 16 / 9,
    );
  }
}
