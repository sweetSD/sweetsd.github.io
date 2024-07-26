import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sweetsd_github/widgets/roundbox.dart';
import 'package:sweetsd_github/widgets/text.dart';
import 'package:sweetsd_github/widgets/widgets.dart';

class ProjectButton extends StatefulWidget {
  ProjectButton(this.name, this.description, this.imageUrl,
      {Key? key, this.onTap, this.useHoveringAnimation = true})
      : super(key: key);

  final String name;
  final String description;
  final String imageUrl;
  final GestureTapCallback? onTap;
  final bool useHoveringAnimation;

  @override
  State<ProjectButton> createState() => _ProjectButtonState();
}

class _ProjectButtonState extends State<ProjectButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    var name = widget.name;
    var description = widget.description;
    var imageUrl = widget.imageUrl;
    var onTap = widget.onTap;
    var useHoveringAnimation = widget.useHoveringAnimation;

    var size = MediaQuery.of(context).size;

    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      onHover: (value) {
        if (useHoveringAnimation) {
          setState(() {
            isHovering = value;
          });
        }
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          transform: Matrix4.identity()..scale(isHovering ? 1.04 : 1.0),
          transformAlignment: Alignment.center,
          child: Hero(
            tag: name,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: SizedBox(
                  width: size.width * 0.4 - 50,
                  height: 200,
                  child: RoundBox(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.fitHeight,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset('assets/images/test.png',
                                        fit: BoxFit.fitHeight),
                              )),
                          Space(15),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: TextApple(name),
                                ),
                                SizedBox(
                                  child: Divider(
                                      color: Colors.grey, thickness: 1.0),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: TextApple(
                                    description,
                                    align: TextAlign.left,
                                    height: 2,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          )),
    );
  }
}

class RoundButton extends StatefulWidget {
  RoundButton({Key? key, this.child, this.onTap}) : super(key: key);

  final Widget? child;
  final GestureTapCallback? onTap;

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    var child = widget.child;
    var onTap = widget.onTap;
    var size = MediaQuery.of(context).size;

    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      onHover: (value) {
        setState(() {
          isHovering = value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        transform: Matrix4.identity()..scale(isHovering ? 1.04 : 1.0),
        transformAlignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
                width: max(size.width * 0.08, 130),
                height: max(size.width * 0.08, 130),
                child: RoundBox(
                  circular: 100,
                  blurRadius: 5,
                  spreadRadius: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: child,
                  ),
                ))),
      ),
    );
  }
}
