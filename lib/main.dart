import 'package:flutter/material.dart';
import 'package:sweetsd_github/screen/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "sweetSD's Portfolio",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const GithubCollectionPage(),
    );
  }
}
