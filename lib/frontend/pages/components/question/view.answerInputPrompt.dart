import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/extension/ext.dart';
import 'package:wrg3/backend/models/model.question.dart';
import 'package:wrg3/frontend/pages/components/question/state.questionComp.dart';
import 'package:wrg3/frontend/pages/posts/state.post.dart';

import '../../../../backend/network/general.executor.dart';
import '../../../../backend/services/service.information.dart';

class AnswerInputPrompt extends StatelessWidget {
  final QuestionModel quesModel;
  AnswerInputPrompt({Key? key, required this.quesModel}) : super(key: key);
  final tec = TextEditingController();
  final postController = Get.find<PostState>();
  final quesController = Get.find<QuestionCompState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Text("whats your question?").h3(),
      content: TextField(
        decoration: InputDecoration(label: Text("write your answer here")),
        maxLines: 5,
        autofocus: true,
        controller: tec,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.close(1);
            },
            child: Text("Cancel")),
        TextButton(
            onPressed: () {
              var map = {
                "content": tec.text,
                "postId": postController.currentPost.id,
                "userInfoId": infoService.userInfo.value.id,
                "questionId": quesModel.id
              };
              GE.answer_createAnswer(data: map);
            },
            child: Text("Submit")),
      ],
    );
  }
}
