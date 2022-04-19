import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'buttonWithStatus.dart';

class AlertBox extends StatelessWidget {
  final String buttontext;
  final String promptText;
  final TextEditingController tec;
  final Function callback;
  const AlertBox(
      {Key? key,
      this.buttontext = "send",
      required this.tec,
      required this.callback,
      required this.promptText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Text("whats your question?").h3(),
      content: TextField(
        decoration: InputDecoration(label: Text(promptText)),
        maxLines: 5,
        autofocus: true,
        controller: tec,
      ),
      actions: [
        ButtonWithStatus(
            text: buttontext,
            callback: () async {
              await callback();
            },
            iconData: CupertinoIcons.paperplane),
      ],
    );
  }
}
