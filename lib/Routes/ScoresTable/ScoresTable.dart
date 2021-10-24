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

  Future<void> _onRemoveItem(Item item) async {
    await _scoreTable.removeResult(item.getDate().toIso8601String());
    final scores = await _getScores();
    setState(() {
      _table = scores;
    });
  }

  Future<List<Item>> _getScores() async {
    final scores = await _scoreTable.getAllResults();
    final results = scores.entries.map((entry) {
      return Item(DateTime.parse(entry.key), entry.value);
    }).toList(growable: false);
    results.sort((a, b) {
      return b.getDate().compareTo(a.getDate());
    });
    return results;
  }

  @override
  void initState() {
    super.initState();
    _getScores().then((results) {
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
            Text('Таблица результатов')
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 40,
            bottom: 40,
            left: 40,
            right: 40
          ),
          child: _table.length == 0 ? Center(
            child: Text('Пока что нет ни одного результата:)'),
          ) : ResultsTable(
            table: _table,
            onRemoveItem: _onRemoveItem,
          )
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