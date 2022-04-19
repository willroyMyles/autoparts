import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/extension/ext.dart';
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Q&A"),
                      TextButton(
                        onPressed: () {
                          controller.toggleHideQuesions();
                        },
                        child: Text(
                            "${controller.hideQuestions ? 'show' : 'hide'} $amount question${amount != 1 ? 's' : ''}"),
                      )
                    ],
                  )),
              LayoutBuilder(builder: (context, straints) {
                print(straints);
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 450),
                  child: controller.hideQuestions
                      ? Container()
                      : Column(children: [
                          ...controller.displayList.values
                              .map((e) => QuestionItem(
                                    model: e,
                                  ))
                        ]),
                  transitionBuilder: (child, animation) {
                    return SizeTransition(
                      sizeFactor: animation,
                      axis: Axis.vertical,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                );
                return AnimatedContainer(
                  duration: Duration(milliseconds: 1250),
                  height: controller.hideQuestions ? 0 : null,
                  child: Column(children: [
                    ...controller.displayList.values.map((e) => QuestionItem(
                          model: e,
                        ))
                  ]),
                );
              })
            ],
          ),
        );
      },
    );
  }
}
