import 'dart:ffi';

import 'package:entry/entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/extension/ext.dart';
import 'package:wrg3/backend/services/service.theme.dart';

class ButtonWithStatus extends StatefulWidget {
  final String text;
  final String loadingText;
  final String successText;
  final String errorText;

  final IconData iconData;
  final Function callback;
  final bool small;
  const ButtonWithStatus(
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
  State<ButtonWithStatus> createState() => _ButtonWithStatusState();
}

class _ButtonWithStatusState extends State<ButtonWithStatus> {
  RxStatus status = RxStatus.empty();
  @override
  Widget build(BuildContext context) {
    var size = widget.small ? 50.0 : 60.0;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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

              if (Get.isDialogOpen ?? false) {
                Get.close(1);
              }
            });
          } catch (e) {
            setState(() {
              status = RxStatus.error(e.toString());
            });
            Get.showSnackbar(
              GetSnackBar(
                message: status.errorMessage,
                icon: Icon(
                  CupertinoIcons.exclamationmark_circle,
                  color: Colors.red,
                  size: 30,
                ),
                duration: Duration(seconds: 2),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                borderRadius: 5,
                barBlur: 10,
                overlayColor: Colors.red,
                leftBarIndicatorColor: Colors.red,
              ),
            );
            Future.delayed(Duration(seconds: 2), () {
              setState(() {
                status = RxStatus.empty();
              });
            });
          }
        },
        child: Container(
          // height: size,
          // width: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: themeService.br,
              border: Border.all(color: themeService.grey, width: 2),
              boxShadow: [themeService.primaryShadow]),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                if (status.isEmpty)
                  Entry.opacity(child: Text(widget.text).h2()),
                if (status.isLoading) Text(widget.loadingText).h2(),
                if (status.isSuccess) Text(widget.successText).h2(),
                if (status.isError) Text(widget.errorText).h2(),
              ]),
        ),
      ),
    );
  }
}
