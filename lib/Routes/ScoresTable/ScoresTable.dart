import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:scorify_app/UI/BottomBarNav.dart';

class ScoresTable extends StatelessWidget {
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
      body: Center(
          child: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.only(top: 40, bottom: 40),
                  child: Text("This is scores table")
              )
          )
      ),
      bottomNavigationBar: BottomBarNav(
        onHomePress: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}