import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusService {
  ServiceObject postStatus = ServiceObject();
}

class ServiceObject {
  Rx<RxStatus> status = RxStatus.loading().obs;
  Function callback = () {};

  setCallback(Function callback1) {
    callback = callback1;
  }

  updateStatus(RxStatus status) {
    this.status.value = status;
    this.status.refresh();
    this.callback();

    if (status.isError) {
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
    }
  }
}

StatusService _service = StatusService();
StatusService get serviceStatus => _service;
