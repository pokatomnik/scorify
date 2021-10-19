import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';

typedef void ResetCb();
typedef void Increment(int value);
typedef void IncrementWithCustom();

class HomeContent extends StatelessWidget {
  final int _total;

  final ResetCb _reset;

  final List<int> _values;

  final Increment _increment;

  final IncrementWithCustom _incrementWithCustom;

  final TextEditingController _textEditingController;

  HomeContent({
    required int total,
    required ResetCb reset,
    required List<int> values,
    required Increment increment,
    required IncrementWithCustom incrementWithCustom,
    required TextEditingController textEditingController
  }) :
    this._total = total,
    this._reset = reset,
    this._values = values,
    this._increment = increment,
    this._incrementWithCustom = incrementWithCustom,
    this._textEditingController = textEditingController
  ;

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Количество очков',
                style: TextStyle(fontSize: 36.0),
              )
            ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_total')
          ],
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                child: Text(
                    'Сбросить / Cохранить',
                    style: TextStyle(fontSize: 24)
                ),
                onPressed: _reset,
              ),
              Text(
                  'Добавить:',
                  style: TextStyle(fontSize: 24)
              )
            ]
        ),
        Wrap(
          // mainAxisAlignment: MainAxisAlignment.center,
            children: _values.map((v) {
              return CupertinoButton(
                child: Text(v.toString()),
                onPressed: () => {
                  _increment(v)
                },
              );
            }).toList()
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: CupertinoTextField(
                  controller: _textEditingController,
                ),
              )
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                child: Text('Добавить'),
                onPressed: _incrementWithCustom,
              )
            ]
        )
      ],
    );
  }
}