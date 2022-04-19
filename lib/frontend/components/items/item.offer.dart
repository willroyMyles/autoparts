import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/extension/ext.dart';
import 'package:wrg3/backend/models/model.offer.dart';
import 'package:wrg3/backend/models/model.question.dart';
import 'package:wrg3/frontend/components/items/item.base.dart';
import 'package:wrg3/frontend/pages/components/question/view.answerInputPrompt.dart';
import 'package:wrg3/frontend/pages/posts/state.post.dart';

class Offeritem extends StatelessWidget {
  final OfferModel? model;
  Offeritem({Key? key, this.model}) : super(key: key);

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
                      model!.message,
                      maxLines: 10,
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
