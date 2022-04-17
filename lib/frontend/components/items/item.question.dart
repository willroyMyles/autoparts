import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/extension/ext.dart';
import 'package:wrg3/backend/models/model.question.dart';
import 'package:wrg3/frontend/components/items/item.base.dart';
import 'package:wrg3/frontend/pages/components/question/view.answerInputPrompt.dart';
import 'package:wrg3/frontend/pages/posts/state.post.dart';

class QuestionItem extends StatelessWidget {
  final QuestionModel? model;
  QuestionItem({Key? key, this.model}) : super(key: key);

  final postController = Get.find<PostState>();

  @override
  Widget build(BuildContext context) {
    return BaseItem(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    "Q",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 25),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("asked by WM").h4(),
                    Text(
                      model!.content,
                      maxLines: 10,
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
            if (postController.currentPost.isOwner && model!.answer == null)
              Container(
                padding: EdgeInsets.only(top: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Spacer(),
                    // Container(
                    //   child: TextButton(
                    //     child: Text("report"),
                    //     onPressed: () {},
                    //   ),
                    // ),
                    Container(
                      child: TextButton(
                        child: Text("answer"),
                        onPressed: () async {
                          await Get.dialog(
                              AnswerInputPrompt(quesModel: model!));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            if (model!.answer != null)
              Divider(
                thickness: .5,
              ),
            if (model!.answer != null)
              Container(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Text(
                          "A",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 25),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text(model!.answer!.content)],
                      )
                    ]),
              )
          ],
        ),
      ),
    );
  }
}
