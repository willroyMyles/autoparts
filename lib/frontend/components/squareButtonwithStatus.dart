import 'dart:ffi';

import 'package:entry/entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/extension/ext.dart';
import 'package:wrg3/backend/services/service.theme.dart';

class SquareButtonWithStatus extends StatefulWidget {
  final String text;
  final String loadingText;
  final String successText;
  final String errorText;

  final IconData iconData;
  final Function callback;
  final bool small;
  const SquareButtonWithStatus(
      {Key? key,
      required this.text,
      required this.iconData,
      required this.callback,
      this.small = false,
      this.loadingText = "loading",
      this.successText = "done",
      this.errorText = "oh my!"})
      : super(key: key);

  @override
  State<SquareButtonWithStatus> createState() => _SquareButtonWithStatusState();
}

class _SquareButtonWithStatusState extends State<SquareButtonWithStatus> {
  RxStatus status = RxStatus.error();
  @override
  Widget build(BuildContext context) {
    var size = widget.small ? 130.0 : 180.0;
    return Container(
      margin: EdgeInsets.all(19),
      child: InkWell(
        onTap: () async {
          try {
            setState(() {
              status = RxStatus.loading();
            });
            await widget.callback();
            setState(() {
              status = RxStatus.success();
            });

            Future.delayed(Duration(seconds: 2), () {
              setState(() {
                status = RxStatus.empty();
              });
            });
          } catch (e) {
            setState(() {
              status = RxStatus.error();
            });
            Future.delayed(Duration(seconds: 2), () {
              setState(() {
                status = RxStatus.empty();
              });
            });
          }
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
            if (status.isEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(widget.iconData),
              ),
            if (status.isLoading)
              Container(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            if (status.isSuccess)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.green,
                  size: 32,
                ),
              ),
            if (status.isError)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  CupertinoIcons.xmark_octagon,
                  color: Colors.red,
                  size: 32,
                ),
              ),
            if (status.isEmpty) Entry.opacity(child: Text(widget.text).h2()),
            if (status.isLoading) Text(widget.loadingText).h2(),
            if (status.isSuccess) Text(widget.successText).h2(),
            if (status.isError) Text(widget.errorText).h2(),
          ]),
        ),
      ),
    );
  }
}
