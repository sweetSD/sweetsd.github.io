import 'package:flutter/material.dart';
import 'package:sweetsd_github/animation/fade.dart';
import 'package:sweetsd_github/widgets/basescreen.dart';
import 'package:sweetsd_github/widgets/text.dart';
import 'package:sweetsd_github/widgets/widgets.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class GithubCollectionPage extends StatefulWidget {
  const GithubCollectionPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GithubCollectionPage> createState() => _GithubCollectionPageState();
}

class _GithubCollectionPageState extends State<GithubCollectionPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'ZuttYdmPfzU',
      params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );

    return BaseScreen(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Space(50),
              YoutubePlayerIFrame(
                controller: _controller,
                aspectRatio: 16 / 9,
              ),
              Space(50),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: 120,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      childAspectRatio: 1 / 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInOffset(
                      delayInMilisecond: index * 150,
                      duration: Duration(milliseconds: 250),
                      offset: Offset(0, 50),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset('images/test.png'),
                            ),
                            TextApple('test image')
                          ],
                        ),
                      ),
                    );
                  }),
              Space(50),
            ],
          ),
        ));
  }
}
