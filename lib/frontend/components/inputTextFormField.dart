import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../backend/services/service.theme.dart';

class InputTextFormField extends StatelessWidget {
  final String label;
  final bool multiLine;
  final TextEditingController crtl;
  const InputTextFormField({
    Key? key,
    required this.label,
    this.multiLine = false,
    required this.crtl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(vertical: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(3),
            child: Text(
              label.capitalize!,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: themeService.br,
              border: Border.all(
                color: themeService.grey,
                width: 1,
              ),
              // boxShadow: [
              //   BoxShadow(
              //       blurRadius: 10,
              //       color: Colors.grey.withOpacity(.2),
              //       spreadRadius: 5)
              // ]
            ),
            child: TextFormField(
              controller: crtl,
              maxLines: multiLine ? 5 : 1,
              validator: (text) {
                if (text!.isEmpty) {
                  return "$label can not be empty";
                }
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
