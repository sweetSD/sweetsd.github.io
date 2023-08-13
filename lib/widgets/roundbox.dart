import 'package:flutter/material.dart';

class RoundBox extends StatelessWidget {
  const RoundBox(
      {super.key,
      this.child,
      this.circular = 15,
      this.shadowColor = const Color(0xffcccccc),
      this.blurRadius = 1.0,
      this.spreadRadius = 1.0,
      this.offset = const Offset(0, 1)});

  final Widget? child;
  final double circular;
  final Color shadowColor;
  final double blurRadius;
  final double spreadRadius;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(circular),
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                blurRadius: blurRadius,
                spreadRadius: spreadRadius,
                offset: offset)
          ]),
      child: child,
    );
  }
}
