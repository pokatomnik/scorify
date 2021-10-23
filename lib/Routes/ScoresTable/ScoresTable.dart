import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scorify_app/Routes/ScoresTable/Item.dart';
import 'package:scorify_app/Routes/ScoresTable/ResultsTable.dart';

import 'package:scorify_app/Storage/ScoreTable.dart';
import 'package:scorify_app/UI/BottomBarNav.dart';

class ScoresTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScoresTableState();
  }
}

class ScoresTableState extends State {
  final ScoreTable _scoreTable = ScoreTable();

  List<Item> _table = [];

  @override
  void initState() {
    super.initState();
    _scoreTable.getAllResults().then((scores) {
      final results = scores.entries.map((entry) {
        return Item(DateTime.parse(entry.key), entry.value);
      }).toList(growable: false);
      setState(() {
        _table = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Scorify')
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 40,
            bottom: 40,
            left: 80,
            right: 80
          ),
          child: ResultsTable(_table)
        )
      ),
      bottomNavigationBar: BottomBarNav(
        onHomePress: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            Navigator.pushReplacementNamed(context, '/');
          }
        },
      ),
    );
  }
}