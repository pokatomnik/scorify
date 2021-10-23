import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scorify_app/Routes/Home/RouteHome.dart';
import 'package:scorify_app/Routes/ScoresTable/ScoresTable.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Подсчет очков',
      initialRoute: '/',
      routes: {
        '/': (context) {
          return RouteHome();
        },
        "/scores": (context) {
          return ScoresTable();
        }
      },
    );
  }
}