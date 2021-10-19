import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';

void scorifyAlert(BuildContext context, String title, String text) {
  showCupertinoDialog<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(text),
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