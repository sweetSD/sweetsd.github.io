import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double size;

  const Space(this.size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
    );
  }
}

showSnackBar(context, msg) {
  final snackBar = SnackBar(
    content: Text(msg),
    duration: Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
