import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './RouteHome.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Подсчет очков',
      home: RouteHome(),
    );
  }
}