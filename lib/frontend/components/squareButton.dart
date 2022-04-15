import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wrg3/backend/extension/ext.dart';
import 'package:wrg3/backend/services/service.theme.dart';

class SquareButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function callback;
  final bool small;
  const SquareButton(
      {Key? key,
      required this.text,
      required this.iconData,
      required this.callback,
      this.small = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = small ? 130.0 : 180.0;
    return Container(
      margin: EdgeInsets.all(19),
      child: InkWell(
        onTap: () {
          callback();
        },
        child: Container(
          height: size,
          width: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: themeService.br,
              border: Border.all(color: themeService.grey, width: 2),
              boxShadow: [themeService.primaryShadow]),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(iconData),
            ),
            Text(text).h2(),
          ]),
        ),
      ),
    );
  }
}
