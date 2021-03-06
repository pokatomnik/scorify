import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scorify_app/Routes/ScoresTable/Item.dart';

import 'package:scorify_app/Routes/ScoresTable/MapIndexed.dart';

class ResultsTable extends StatelessWidget {
  final Iterable<Item> _table;

  final Function(Item) _onRemoveItem;

  ResultsTable({
    required Iterable<Item> table,
    required void onRemoveItem(Item item)
  }):
    this._table = table,
    this._onRemoveItem = onRemoveItem;

  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.all(width: 1.0, color: Colors.black12),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
              decoration: BoxDecoration(
                color: Color.fromRGBO(198, 198, 198, 1.0)
              ),
              children: [
                TableCell(
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        'Дата',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold
                        )
                      ),
                    )
                ),
                TableCell(
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        'Очки',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold
                        )
                      ),
                    )
                ),
                TableCell(
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      ' ',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold
                      )
                    ),
                  )
                )
              ]
          ),
          ...mapIndexed<Item, TableRow>(_table, (item, index) {
            return TableRow(
              key: ValueKey(item.getDate().toIso8601String()),
              decoration: index % 2 > 0 ? BoxDecoration(
                  color: Color.fromRGBO(198, 198, 198, 0.3)
              ) : null,
              children: [
                TableCell(
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      item.formatDate(),
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
                TableCell(
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      item.score.toString(),
                      textAlign: TextAlign.center
                    ),
                  )
                ),
                TableCell(
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: CupertinoButton(
                      child: const Text(
                        'Удалить',
                        softWrap: false,

                      ),
                      onPressed: () {
                        _onRemoveItem(item);
                      },
                    ),
                  )
                )
              ]
            );
          })
        ]
    );
  }
}