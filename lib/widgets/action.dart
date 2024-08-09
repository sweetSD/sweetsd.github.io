import 'package:flutter/material.dart';
import 'package:sweetsd_github/const/image.dart';
import 'package:sweetsd_github/data/action.dart';
import 'package:sweetsd_github/widgets/widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ActionButton extends StatefulWidget {
  const ActionButton(this.info, {super.key, this.circular = 100});

  final ActionInfo info;
  final double circular;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  Widget createThumbnail() {
    var type = widget.info.type;
    if (type == ActionType.github) return Image.asset(Images.github);
    if (type == ActionType.naverBlog) return Image.asset(Images.naverBlog);
    if (type == ActionType.playStore) return Image.asset(Images.playStore);
    if (type == ActionType.linkedIn) return Image.asset(Images.linkedIn);
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      circular: widget.circular,
      child: createThumbnail(),
      onTap: () => launchUrlString(widget.info.url),
    );
  }
}
