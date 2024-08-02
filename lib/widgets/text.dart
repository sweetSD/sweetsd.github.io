import 'package:flutter/material.dart';

enum TextType { light, regular, bold, extraBold }

FontWeight getWeightFromType(TextType type) {
  if (type == TextType.light) return FontWeight.w200;
  if (type == TextType.regular) return FontWeight.w400;
  if (type == TextType.bold) return FontWeight.w600;
  if (type == TextType.extraBold) return FontWeight.w800;
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

  static TextStyle getStyle(
          {Color? color,
          fontSize = 14,
          height = 1.5,
          type = TextType.regular,
          shadows = const <Shadow>[]}) =>
      TextStyle(
          color: color,
          fontSize: fontSize,
          height: height,
          fontWeight: getWeightFromType(type),
          shadows: shadows,
          fontFamily: 'AppleSDGothicNeo');

  const TextApple(
    this.text, {
    super.key,
    this.color,
    this.size = 14,
    this.height = 1.5,
    this.type = TextType.regular,
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
      style: getStyle(
        color: color,
        fontSize: size,
        height: height,
        type: type,
        shadows: shadows,
      ),
    );
  }
}
