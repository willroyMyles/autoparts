import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/frontend/components/items/item.question.dart';
import 'package:wrg3/frontend/pages/components/question/state.questionComp.dart';

class QuestionComponent extends StatelessWidget {
  final PostModel model;
  QuestionComponent({Key? key, required this.model}) : super(key: key);
  final controller = Get.put(QuestionCompState());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionCompState>(
      initState: (_) {
        controller.setCurrentPostModel(model);
      },
      builder: (_) {
        var amount = controller.displayList.length;

        return Container(
          margin: EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text("$amount question${amount != 1 ? 's' : ''}")),
              ...controller.displayList.values.map((e) => QuestionItem(
                    model: e,
                  ))
            ],
          ),
        );
      },
    );
  }
}
