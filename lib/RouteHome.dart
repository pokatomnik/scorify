import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void SetValue(int value);

typedef Widget StateControl(int value, SetValue setValue);

class RouteHomeState extends State<RouteHome> {
  static final _defaultValues = [10, 20, 50, 100, 300];

  TextEditingController _textEditingController = TextEditingController(text: '150');

  List<int> _values = _defaultValues;

  int _total = 0;

  _increment(int value) {
    setState(() {
      _total += value;
    });
  }

  _reset() {
    setState(() {
      _total = 0;
    });
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
      showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Неверное значение'),
          content: const Text('Укажите верное числовое значение'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: const Text('Понятно'),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    }
  }

  @override
  initState() {
    super.initState();
  }

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoButton(
                            child: Text(
                              'Сбросить',
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
                )
              )
            )
        )
    );
  }
}

class RouteHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RouteHomeState();
  }
}