import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweetsd_github/data/project.dart';
import 'package:sweetsd_github/screen/main.dart';

void main() {
  runApp(MyApp());
}

class Data {
  Map<String, String> info = {};
  List<Project> gameList = List.empty();
  List<Project> appList = List.empty();
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Future<Data> parseData() async {
    Data data = Data();

    var infoJson = await rootBundle.loadString('assets/data/info.json');
    var gameJson = await rootBundle.loadString('assets/data/game.json');
    var appJson = await rootBundle.loadString('assets/data/app.json');

    Map<String, dynamic> infoJsonMap = jsonDecode(infoJson);
    data.info = infoJsonMap.map((key, value) => MapEntry(key, value as String));

    List<dynamic> gameJsonList = jsonDecode(gameJson);
    data.gameList = gameJsonList.map((e) => Project.fromJson(e)).toList();

    List<dynamic> appJsonList = jsonDecode(appJson);
    data.appList = appJsonList.map((e) => Project.fromJson(e)).toList();

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "sweetSD's Portfolio",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: FutureBuilder(
        future: parseData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data as Data;
            return GithubCollectionPage(data.info, data.gameList, data.appList);
          }
          return Container();
        },
      ),
    );
  }
}
