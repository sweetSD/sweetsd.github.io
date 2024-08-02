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

  ListView createProjectList(String listName, List<Project> projects) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: projects.length + 1,
        itemBuilder: ((context, index) {
          if (index == 0) {
            return FadeInOffset(
              offset: const Offset(0, 50),
              delayInMilisecond: 600,
              child: TextApple(
                listName,
                size: 38,
                type: TextType.bold,
              ),
            );
          }
          var project = projects[index - 1];
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
        }),
        separatorBuilder: (context, index) => Space(50));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var email = widget.appData.info["email"];
    var phone = widget.appData.info["phone"];

    debugPrint(size.width.toString());
    debugPrint(size.height.toString());

    return BaseScreen(
        body: SizedBox(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.07, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextApple(
              "sweetSD's Portfolio",
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
              width: size.width * 0.2,
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
            InkWell(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email_outlined),
                  Space(5),
                  TextApple(
                    email!,
                    size: 24,
                    height: 1,
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
            Space(10),
            InkWell(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call_outlined),
                  Space(5),
                  TextApple(
                    phone!,
                    size: 24,
                    height: 1,
                  ),
                ],
              ),
              onTap: () async {
                String phoneUrl = 'tel:$phone';
                try {
                  await launchUrlString(phoneUrl);
                } catch (e) {
                  await Clipboard.setData(ClipboardData(text: phone));
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
                      widget.appData.info.length,
                      (index) => FadeInScale(
                          scale: 0.5,
                          child: SizedBox(
                            width: 150,
                            height: 150,
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
                  GridView.count(
                    childAspectRatio: 0.9,
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: [
                      createProjectList('게임', widget.appData.gameList),
                      createProjectList('앱', widget.appData.appList),
                    ],
                  ),
                if (size.width < 1500)
                  ListView(
                    shrinkWrap: true,
                    children: [
                      createProjectList('게임', widget.appData.gameList),
                      createProjectList('앱', widget.appData.appList),
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
