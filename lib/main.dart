import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweetsd_github/data/app.dart';
import 'package:sweetsd_github/data/project.dart';
import 'package:sweetsd_github/screen/error.dart';
import 'package:sweetsd_github/screen/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Future<AppData> parseData() async {
    AppData data = AppData();

    var infoJson = await rootBundle.loadString('assets/data/info.json');
    var gameJson = await rootBundle.loadString('assets/data/game.json');
    var appJson = await rootBundle.loadString('assets/data/app.json');

    Map<String, dynamic> infoJsonMap = jsonDecode(infoJson);
    data.info = (infoJsonMap["info"] as Map<String, dynamic>)
        .map((key, value) => MapEntry(key, value as String));
    data.links = (infoJsonMap["links"] as Map<String, dynamic>)
        .map((key, value) => MapEntry(key, value as String));

    List<dynamic> gameJsonList = jsonDecode(gameJson);
    data.gameList = gameJsonList.map((e) => Project.fromJson(e)).toList();

    List<dynamic> appJsonList = jsonDecode(appJson);
    data.appList = appJsonList.map((e) => Project.fromJson(e)).toList();

    return data;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return MaterialApp(
      title: "Portfolio",
      theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      home: FutureBuilder(
        future: parseData(),
        builder: (context, snapshot) {
          if (size.width < 600) {
            return ErrorPage();
          }
          if (snapshot.hasData) {
            var data = snapshot.data as AppData;
            return GithubCollectionPage(data);
          }
          return Container();
        },
      ),
    );
  }
}
