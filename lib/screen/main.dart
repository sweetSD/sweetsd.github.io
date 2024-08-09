import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweetsd_github/animation/fade.dart';
import 'package:sweetsd_github/data/action.dart';
import 'package:sweetsd_github/data/app.dart';
import 'package:sweetsd_github/data/project.dart';
import 'package:sweetsd_github/screen/info.dart';
import 'package:sweetsd_github/widgets/action.dart';
import 'package:sweetsd_github/widgets/basescreen.dart';
import 'package:sweetsd_github/widgets/widgets.dart';
import 'package:sweetsd_github/widgets/text.dart';
import 'package:sweetsd_github/widgets/common.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class GithubCollectionPage extends StatefulWidget {
  const GithubCollectionPage(this.appData, {Key? key}) : super(key: key);

  final AppData appData;

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

  Widget createProjectList(List<Project> projects) {
    return Column(
        children: List.generate(projects.length, ((index) {
      var project = projects[index];
      return FadeInOffset(
          offset: const Offset(0, 50),
          delayInMilisecond: 600,
          child: ProjectButton(
            project.name!,
            project.description!,
            project.imageUrl!,
            actions: project.actions!,
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPage(
                        project.name!,
                        project.description!,
                        project.imageUrl!,
                        project.media!),
                  ))
            },
          ));
    })));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var email = widget.appData.info["email"];

    return BaseScreen(
        body: SizedBox(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextApple(
              "Portfolio",
              type: TextType.extraBold,
              size: 48,
            ),
            SizedBox(
              width: 550,
              height: 50,
              child: Divider(
                height: 1,
              ),
            ),
            SizedBox(
              width: 400,
              child: YoutubePlayerIFrame(
                controller: _controller,
                aspectRatio: 16 / 9,
              ),
            ),
            SizedBox(
              width: 550,
              height: 50,
              child: Divider(
                height: 1,
              ),
            ),
            SizedBox(
              height: 35,
              child: TextApple(
                "CONTACT",
                type: TextType.extraBold,
              ),
            ),
            InkWell(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email_outlined),
                  Space(5),
                  TextApple(
                    email!,
                    size: 18,
                    height: 1,
                    type: TextType.light,
                  ),
                ],
              ),
              onTap: () async {
                String mailUrl = 'mailto:$email';
                try {
                  await launchUrlString(mailUrl);
                } catch (e) {
                  await Clipboard.setData(ClipboardData(text: email));
                }
              },
            ),
            SizedBox(
              width: 550,
              height: 50,
              child: Divider(
                height: 1,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.appData.links.length,
                      (index) => FadeInScale(
                          scale: 0.5,
                          child: SizedBox(
                            width: 125,
                            height: 125,
                            child: ActionButton(ActionInfo(
                                type: ActionType.fromJson(
                                    widget.appData.links.keys.elementAt(index)),
                                url: widget.appData.links.values
                                    .elementAt(index))),
                          )),
                    )),
                SizedBox(
                  width: size.width * 0.8,
                  height: 50,
                  child: Divider(
                    height: 1,
                  ),
                ),
                if (size.width >= 1500)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      createProjectList(widget.appData.gameList),
                      createProjectList(widget.appData.appList),
                    ],
                  ),
                if (size.width < 1500)
                  Column(
                    children: [
                      createProjectList(widget.appData.gameList),
                      createProjectList(widget.appData.appList),
                    ],
                  ),
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
