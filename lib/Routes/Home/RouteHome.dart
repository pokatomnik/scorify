import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scorify_app/Routes/Home/HomeContent.dart';
import 'dart:core';

import 'package:scorify_app/Storage/ScoreTable.dart';
import 'package:scorify_app/Storage/RecentValue.dart';
import 'package:scorify_app/Common/Dialog/scorifyAlert.dart';

typedef void SetValue(int value);

typedef Widget StateControl(int value, SetValue setValue);

class RouteHomeState extends State<RouteHome> {
  static const _defaultValues = [10, 20, 50, 100, 300];

  ScoreTable _scoreTable = ScoreTable();

  RecentValue _recentValue = RecentValue(0);

  TextEditingController _textEditingController = TextEditingController(text: '150');

  List<int> _values = _defaultValues;

  int _totalValue = 0;

  set _total(int value) {
    _recentValue.set(value);
    _totalValue = value;
  }

  int get _total {
    return _totalValue;
  }

  _increment(int value) {
    setState(() {
      _total += value;
    });
  }

  _reset() {
    final total = _total;
    setState(() {
      _total = 0;
    });

    _scoreTable.saveResult(total);
  }

  _incrementWithCustom() {
    try {
      final int newValue = int.parse(this._textEditingController.text);
      final bool alreadyHasValue = _values.any((currentValue) {
        return currentValue == newValue;
      });
      setState(() {
        _total += newValue;
        if (!alreadyHasValue) {
          _values.add(newValue);
        }
      });
    } catch (e) {
      scorifyAlert(
        context,
        'Неверное значение',
        'Укажите верное числовое значение'
      );
    }
  }

  @override


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Scorify')
            ],
          ),
        ),
        child: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 80, bottom: 80),
                child: HomeContent(
                  total: _total,
                  reset: _reset,
                  values: _values,
                  increment: _increment,
                  incrementWithCustom: _incrementWithCustom,
                  textEditingController: _textEditingController,
                )
              )
            )
        )
    );
  }

  @override
  void initState() {
    super.initState();
    this._recentValue.get().then((recentValue) {
      setState(() {
        _total = recentValue;
      });
    });
  }
}

class RouteHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RouteHomeState();
  }
}