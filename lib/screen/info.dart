import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sweetsd_github/data/media.dart';
import 'package:sweetsd_github/widgets/basescreen.dart';
import 'package:sweetsd_github/widgets/widgets.dart';
import 'package:sweetsd_github/widgets/common.dart';

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
    var size = MediaQuery.of(context).size;

    var isMultipleMedia = widget.media.length > 1;

    return BaseScreen(
      title: widget.name,
      body: Column(
        children: [
          SizedBox(
            width: max(size.width * 0.5, 550),
            child: ProjectButton(
              widget.name,
              widget.description,
              widget.iconImage,
              useHoveringAnimation: false,
            ),
          ),
          Expanded(
            child: Stack(alignment: Alignment.center, children: [
              CarouselSlider.builder(
                carouselController: carouselController,
                options: CarouselOptions(
                  aspectRatio: 24 / 9,
                  viewportFraction: isMultipleMedia ? 0.7 : 1.0,
                  enableInfiniteScroll: isMultipleMedia,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                itemCount: widget.media.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: widget.media[itemIndex].createWidget(),
                ),
              ),
              if (isMultipleMedia)
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () => carouselController.previousPage(),
                      icon: Icon(
                        Icons.arrow_left_outlined,
                      )),
                ),
              if (isMultipleMedia)
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () => carouselController.previousPage(),
                      icon: Icon(
                        Icons.arrow_right_outlined,
                      )),
                )
            ]),
          ),
          Space(15),
          if (isMultipleMedia)
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
      padding:
          EdgeInsets.symmetric(horizontal: size.width * 0.07, vertical: 15),
    );
  }
}
