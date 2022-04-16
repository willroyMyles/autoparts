import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetCloseButton extends StatelessWidget {
  const BottomSheetCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.close(1);
        },
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.2))
                ]),
            padding: EdgeInsets.all(15),
            child: Icon(Icons.close)),
      ),
    );
  }
}
