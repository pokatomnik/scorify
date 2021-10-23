import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void OnSelect();

@immutable
class BottomBarNav extends StatelessWidget {
  final OnSelect _onHomePress;

  final OnSelect _onScoresPress;

  BottomBarNav({
    OnSelect? onHomePress,
    OnSelect? onScoresPress,
  }):
    this._onHomePress = onHomePress ?? (() {}),
    this._onScoresPress = onScoresPress ?? (() {});

  @override
  Widget build(BuildContext context) {
    final currentRouteIndex = ModalRoute.of(context)?.settings.name == '/' ? 0 : 1;
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.sports_score),
            label: 'Рекорды',
          )
        ],
      onTap: (int index) {
          switch (index) {
            case 0: _onHomePress(); return;
            case 1: _onScoresPress(); return;
            default: return;
          }
      },
      currentIndex: currentRouteIndex,
    );
  }
}