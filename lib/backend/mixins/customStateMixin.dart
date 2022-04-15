import 'package:get/get.dart';

mixin CSM {
  RxStatus status = RxStatus.loading();
  Function callback = () {};

  setCallback(Function callback1) {
    callback = callback1;
  }

  updateStatus(RxStatus sta) {
    status = sta;
    callback();
  }
}
