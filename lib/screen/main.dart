import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sweetsd_github/animation/fade.dart';
import 'package:sweetsd_github/data/project.dart';
import 'package:sweetsd_github/screen/info.dart';
import 'package:sweetsd_github/widgets/basescreen.dart';
import 'package:sweetsd_github/widgets/sweetsd_widgets.dart';
import 'package:sweetsd_github/widgets/text.dart';
import 'package:sweetsd_github/widgets/widgets.dart';
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
                        child: RoundButton(
                          child: Image.asset('assets/images/ic_github.png'),
                          onTap: () =>
                              launchUrlString('https://github.com/sweetSD'),
                        )),
                    Space(50),
                    FadeInScale(
                        scale: 0.5,
                        delayInMilisecond: 300,
                        child: RoundButton(
                          child: Image.asset('assets/images/ic_naver_blog.png'),
                          onTap: () => launchUrlString(
                              'https://blog.naver.com/sweets125'),
                        )),
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
                                    child: ProjectButton(
                                      game.name!,
                                      game.description!,
                                      game.imageUrl!,
                                      onTap: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => InfoPage(
                                                  game.name!,
                                                  game.description!,
                                                  game.imageUrl!,
                                                  game.media!),
                                            ))
                                      },
                                    ))
                                : SizedBox(),
                          ),
                          SizedBox(
                            child: app != null
                                ? FadeInOffset(
                                    offset: const Offset(0, 50),
                                    delayInMilisecond: 600,
                                    child: ProjectButton(
                                      app.name!,
                                      app.description!,
                                      app.imageUrl!,
                                      onTap: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => InfoPage(
                                                  app.name!,
                                                  app.description!,
                                                  app.imageUrl!,
                                                  app.media!),
                                            ))
                                      },
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
