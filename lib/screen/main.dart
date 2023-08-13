import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sweetsd_github/animation/fade.dart';
import 'package:sweetsd_github/widgets/basescreen.dart';
import 'package:sweetsd_github/widgets/roundbox.dart';
import 'package:sweetsd_github/widgets/text.dart';
import 'package:sweetsd_github/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class GithubCollectionPage extends StatefulWidget {
  const GithubCollectionPage({Key? key}) : super(key: key);

  @override
  State<GithubCollectionPage> createState() => _GithubCollectionPageState();
}

class _GithubCollectionPageState extends State<GithubCollectionPage> {
  final _controller = YoutubePlayerController(
    initialVideoId: 'ZuttYdmPfzU',
    params: YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  Widget _getProjectBox(String imageUrl, String name, String description) {
    return SizedBox(
      width: 1200,
      height: 150,
      child: RoundBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              SizedBox(
                width: 150,
                child: Image.network(imageUrl),
              ),
              Space(15),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextApple(name),
                    SizedBox(
                      child: Divider(color: Colors.grey, thickness: 1.0),
                    ),
                    TextApple(description),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getMiniInfo(String imageUrl, String name, String url) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () async {
        await launchUrlString(url);
      },
      child: SizedBox(
        width: max(size.width * 0.1, 100),
        height: max(size.width * 0.13, 130),
        child: RoundBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                SizedBox(
                  width: 150,
                  child: Image.network(imageUrl),
                ),
                Expanded(
                    child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: TextApple(
                    name,
                    size: 24,
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BaseScreen(
        body: SizedBox(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextApple(
              "sweetSD's Portfolio",
              type: TextType.extraBold,
              size: 48,
            ),
            Space(50),
            SizedBox(
              width: size.width * 0.6,
              child: YoutubePlayerIFrame(
                controller: _controller,
                aspectRatio: 16 / 9,
              ),
            ),
            Space(50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeInScale(
                        scale: 0.5,
                        child: _getMiniInfo(
                            'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
                            'Github',
                            'https://github.com/sweetSD')),
                    Space(50),
                    FadeInScale(
                        scale: 0.5,
                        delayInMilisecond: 300,
                        child: _getMiniInfo(
                            'https://play-lh.googleusercontent.com/NMaV7YqpGLsUHf3drTmT3sfQ2XmFdP7-DyW9vG3AkSWyRv3GWEu9BiRk1jWE1F1ojbA',
                            'Naver Blog',
                            'https://blog.naver.com/sweets125')),
                  ],
                ),
                Space(50),
                FadeInOffset(
                  offset: const Offset(0, 50),
                  delayInMilisecond: 600,
                  child: _getProjectBox(
                      'https://media.tenor.com/eIyjRDX-_NkAAAAC/takanashi-hoshino-blue-archive.gif',
                      '프로젝트 이름',
                      '설명'),
                )
              ],
            ),
            Space(50),
            TextApple(
              'Thank you for coming.',
              size: 24,
            ),
          ],
        ),
      ),
    ));
  }
}
