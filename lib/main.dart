import 'package:flutter/material.dart';
import 'package:sweetsd_github/screens/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sweetSD Github',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const GithubCollectionPage(title: '무슨 일로 오셨나요'),
    );
  }
}
