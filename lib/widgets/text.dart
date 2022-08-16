import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum TextType { Light, Regular, Bold, ExtraBold }

FontWeight getWeightFromType(TextType type) {
  if (type == TextType.Light) return FontWeight.w200;
  if (type == TextType.Regular) return FontWeight.w400;
  if (type == TextType.Bold) return FontWeight.w600;
  if (type == TextType.ExtraBold) return FontWeight.w800;
  return FontWeight.normal;
}

class TextApple extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final double height;
  final TextType type;
  final TextAlign align;
  final TextOverflow overflow;
  final List<Shadow> shadows;
  final int? maxLines;

  const TextApple(
    this.text, {
    this.color = Colors.white,
    this.size = 14,
    this.height = 1.5,
    this.type = TextType.Regular,
    this.align = TextAlign.center,
    this.overflow = TextOverflow.ellipsis,
    this.shadows = const [],
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
          color: color,
          fontSize: size,
          height: height,
          fontWeight: getWeightFromType(type),
          shadows: shadows,
          fontFamily: 'AppleSDGothicNeo'),
    );
  }
}
