import 'package:flutter/material.dart';

class RoundBox extends StatelessWidget {
  const RoundBox(
      {super.key,
      this.child,
      this.circular = 15,
      this.blurRadius = 1.0,
      this.spreadRadius = 1.0,
      this.offset = const Offset(0, 1)});

  final Widget? child;
  final double circular;
  final double blurRadius;
  final double spreadRadius;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[800] : Colors.white,
          borderRadius: BorderRadius.circular(circular),
          boxShadow: [
            BoxShadow(
                color: isDarkMode ? Colors.black : const Color(0xffcccccc),
                blurRadius: blurRadius,
                spreadRadius: spreadRadius,
                offset: offset)
          ]),
      child: child,
    );
  }
}
