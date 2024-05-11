import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweetsd_github/animation/fade.dart';
import 'package:sweetsd_github/data/project.dart';
import 'package:sweetsd_github/widgets/basescreen.dart';
import 'package:sweetsd_github/widgets/roundbox.dart';
import 'package:sweetsd_github/widgets/text.dart';
import 'package:sweetsd_github/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class GithubCollectionPage extends StatefulWidget {
  const GithubCollectionPage(
      this.github, this.blog, this.gameList, this.appList,
      {Key? key})
      : super(key: key);

  final String github;
  final String blog;
  final List<Project> gameList;
  final List<Project> appList;

  @override
  State<GithubCollectionPage> createState() => _GithubCollectionPageState();
}

class _GithubCollectionPageState extends State<GithubCollectionPage> {
  final _controller = YoutubePlayerController(
    initialVideoId: 'kFmYbMaszK8',
    params: YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  Widget _getProjectBox(
      String? imageUrl, String? name, String? description, String? url) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        if (url != null) {
          launchUrl(Uri.parse(url));
        }
      },
      child: SizedBox(
        width: size.width * 0.4,
        height: 200,
        child: RoundBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  child: imageUrl != null && imageUrl.isNotEmpty
                      ? Image.network(
                          imageUrl,
                          fit: BoxFit.fitHeight,
                        )
                      : Image.asset('assets/images/test.png',
                          fit: BoxFit.fitHeight),
                ),
                Space(15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextApple(name ?? "Unknown"),
                      SizedBox(
                        child: Divider(color: Colors.grey, thickness: 1.0),
                      ),
                      TextApple(
                        description ?? "Unknown",
                        align: TextAlign.left,
                        height: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
          width: max(size.width * 0.08, 130),
          height: max(size.width * 0.08, 130),
          child: RoundBox(
            circular: 100,
            blurRadius: 5,
            spreadRadius: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(imageUrl),
            ),
          )),
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
        padding: EdgeInsets.symmetric(horizontal: 150, vertical: 50),
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
              width: size.width * 0.3,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextApple(
                        '게임',
                        size: 38,
                        type: TextType.bold,
                      ),
                      TextApple(
                        '앱',
                        size: 38,
                        type: TextType.bold,
                      ),
                    ],
                  ),
                ),
                Space(30),
                ListView.separated(
                    shrinkWrap: true,
                    itemCount:
                        max(widget.gameList.length, widget.appList.length),
                    itemBuilder: ((context, index) {
                      var game = index < widget.gameList.length
                          ? widget.gameList[index]
                          : null;
                      var app = index < widget.appList.length
                          ? widget.appList[index]
                          : null;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: game != null
                                ? FadeInOffset(
                                    offset: const Offset(0, 50),
                                    delayInMilisecond: 600,
                                    child: _getProjectBox(
                                      game.imageUrl,
                                      game.name,
                                      game.description,
                                      game.clickUrl,
                                    ))
                                : SizedBox(),
                          ),
                          SizedBox(
                            child: app != null
                                ? FadeInOffset(
                                    offset: const Offset(0, 50),
                                    delayInMilisecond: 600,
                                    child: _getProjectBox(
                                      app.imageUrl,
                                      app.name,
                                      app.description,
                                      app.clickUrl,
                                    ))
                                : SizedBox(),
                          ),
                        ],
                      );
                    }),
                    separatorBuilder: (context, index) => Space(50)),
                Space(50),
              ],
            ),
            Space(50),
            TextApple(
              'Thank you for coming.',
              size: 24,
            ),
            Space(50),
          ],
        ),
      ),
    ));
  }
}
