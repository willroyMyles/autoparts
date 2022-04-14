import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:wrg3/backend/services/service.theme.dart';

import '../enums/enum.status.dart';

extension StatusExtension on Status {
  String toCommonString() {
    var str = this.toString();
    str = str.replaceRange(0, 7, '');
    str = str.replaceFirst("_", " ");
    return str.toLowerCase();
  }

  Color color() {
    if (this == Status.CANCELED) return Colors.red;
    if (this == Status.PROCESSING) return Colors.amber;
    if (this == Status.OPEN) return Colors.green;
    if (this == Status.EXPIRED) return Colors.grey;
    if (this == Status.COMPLETED) return Colors.blue;
    return Colors.grey;
  }

  Widget statusText() {
    return Entry.scale(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
        margin: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
            border: Border.all(
              width: .5,
              color: color().withOpacity(.3),
            ),
            borderRadius: themeService.br * 10,
            color: themeService.grey),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: color()),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3, right: 3),
              child: Text(
                toCommonString(),
                textScaleFactor: .9,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: color().withOpacity(.7)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
