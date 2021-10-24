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
            Text(_total.toString(), style: TextStyle(fontSize: 36.0))
          ],
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                child: const Text(
                    'Cохранить',
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
                width: 150,
                child: CupertinoTextField(
                  decoration: CupertinoTextField().decoration?.copyWith(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                      topRight: Radius.zero,
                      bottomRight: Radius.zero,
                    ),
                  ),
                  controller: _textEditingController,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(40, 40)
                ).copyWith(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                    )
                  )
                ),
                child: Text('Добавить'),
                onPressed: _incrementWithCustom,
              )
            ]),
      ],
    );
  }
}