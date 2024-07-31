import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double size;

  const Space(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
    );
  }
}

showSnackBar(context, msg, {delay = 3}) {
  final snackBar = SnackBar(
    content: Text(msg),
    duration: Duration(seconds: delay),
  );
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
