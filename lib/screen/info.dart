import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sweetsd_github/data/media.dart';
import 'package:sweetsd_github/widgets/basescreen.dart';
import 'package:sweetsd_github/widgets/sweetsd_widgets.dart';
import 'package:sweetsd_github/widgets/widgets.dart';

class InfoPage extends StatefulWidget {
  const InfoPage(this.name, this.description, this.iconImage, this.media,
      {super.key});

  final String name;
  final String description;
  final String iconImage;
  final List<MediaInfo> media;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: widget.name,
      body: Column(
        children: [
          ProjectButton(
            widget.name,
            widget.description,
            widget.iconImage,
            useHoveringAnimation: false,
          ),
          Expanded(
            child: CarouselSlider.builder(
              carouselController: carouselController,
              options: CarouselOptions(
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              itemCount: widget.media.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      widget.media[itemIndex].createWidget(),
            ),
          ),
          Space(15),
          Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: widget.media.length,
                onDotClicked: (index) =>
                    carouselController.animateToPage(index),
              )),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    );
  }
}
