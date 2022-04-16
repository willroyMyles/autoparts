import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/extension/ext.dart';
import 'package:wrg3/backend/services/service.carData.dart';
import 'package:wrg3/frontend/components/inputOptionFormField.dart';
import 'package:wrg3/frontend/components/squareButton.dart';
import 'package:wrg3/frontend/components/squareButtonwithStatus.dart';
import 'package:wrg3/frontend/pages/create%20post/state.createPost.dart';

import '../../../backend/services/service.theme.dart';
import '../../components/inputTextFormField.dart';

class CreatePost extends StatelessWidget {
  CreatePost({Key? key}) : super(key: key);
  final controller = Get.put(CreatePostState());
  final dividedWidth = Get.width / 2.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<CreatePostState>(builder: (con) {
        return SingleChildScrollView(
            child: Form(
          key: controller.formKey,
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              InputTextFormField(
                label: "title",
                crtl: controller.controls["title"]!,
              ),
              InputTextFormField(
                label: "content",
                crtl: controller.controls["content"]!,
                multiLine: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    width: dividedWidth,
                    child: InputOptionFormField(
                      label: "make",
                      options: serviceCarData.makes,
                      crtl: controller.controls["make"]!,
                      callback: (val) {
                        controller.setMake(val);
                      },
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    width: dividedWidth,
                    child: InputOptionFormField(
                      label: "model",
                      options: serviceCarData.getModels(controller.make),
                      crtl: controller.controls["model"]!,
                      callback: (val) {
                        controller.setModel(val);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    width: dividedWidth,
                    child: InputOptionFormField(
                      label: "year",
                      options: List.generate(
                          100, (index) => DateTime.now().year - index),
                      crtl: controller.controls["year"]!,
                      callback: (val) {
                        controller.setYear(val);
                      },
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    width: dividedWidth,
                    child: InputOptionFormField(
                      label: "category",
                      options: serviceCarData.category,
                      crtl: controller.controls["category"]!,
                      callback: (val) {
                        controller.setCategory(val);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SquareButtonWithStatus(
                  small: true,
                  text: "submit",
                  iconData: CupertinoIcons.paperplane,
                  callback: controller.onSubmit),
              SizedBox(
                height: 30,
              ),
            ]),
          ),
        ));
      }),
    );
  }
}
