import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/extension/ext.dart';
import 'package:wrg3/backend/mixins/customStateMixin.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/backend/models/model.question.dart';
import 'package:wrg3/backend/services/service.information.dart';
import 'package:wrg3/backend/services/service.status.dart';
import 'package:wrg3/backend/services/service.theme.dart';
import 'package:wrg3/frontend/components/bottomSheetCloseButton.dart';
import 'package:wrg3/frontend/components/expandingButton.dart';

import '../../../backend/network/general.executor.dart';

class PostState extends GetxController with CSM {
  late PostModel currentPost;

  shouldRefresh() {
    refresh();
  }

  makeAnOffer() async {
    Get.close(1);
    Get.dialog(AlertDialog(
      title: Text("make your offer").h3(),
      content: TextField(
        decoration: InputDecoration(label: Text("write your offer here")),
        maxLines: 5,
        autofocus: true,
      ),
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ExpandingButton(
          text: "cancel",
          level: EBLevel.Secondary,
        ),
        ExpandingButton(
          text: "Submit",
          level: EBLevel.Primary,
        ),
      ],
    ));
  }

  showLeaveComment() {}
  addToWatch() {
    Get.close(1);

    Get.showSnackbar(
      GetSnackBar(
        message: "Added to watch",
        icon: Icon(
          CupertinoIcons.eyeglasses,
          color: Colors.white,
        ),
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        borderRadius: 5,
      ),
    );
  }

  askAQuestion() async {
    Get.close(1);
    TextEditingController tec = TextEditingController();
    Get.dialog(AlertDialog(
      title: Text("whats your question?").h3(),
      content: TextField(
        decoration: InputDecoration(label: Text("write your question here")),
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
              // QuestionModel model = QuestionModel.empty();
              // model.content = tec.text;
              // model.postId = currentPost.id;
              // model.userInfoId = infoService.userInfo.value.userId;

              var map = {
                "content": tec.text,
                "postId": currentPost.id,
                "userInfoId": infoService.userInfo.value.id
              };
              GE.question_createQuestion(data: map);
            },
            child: Text("Submit")),
      ],
    ));
  }

  Widget getBottomSheet() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      title: Text("Ask a question").h2(),
                      minVerticalPadding: 5,
                      leading: Icon(Icons.question_mark_rounded),
                      onTap: () {
                        askAQuestion();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      title: Text("Make an offer").h2(),
                      minVerticalPadding: 5,
                      leading: Icon(Icons.clean_hands_outlined),
                      onTap: () {
                        makeAnOffer();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      tileColor: Colors.red,
                      title: Text("Add to watching").h2(),
                      minVerticalPadding: 5,
                      leading:
                          Icon(CupertinoIcons.eyeglasses, color: Colors.black),
                      onTap: () {
                        addToWatch();
                      },
                    ),
                  )
                ],
              ),
            ),
            BottomSheetCloseButton()
          ],
        ));
  }

  @override
  void onInit() {
    super.onInit();
    serviceStatus.postStatus.setCallback(this.refresh);
  }

  void getPosts() async {
    serviceStatus.postStatus.updateStatus(RxStatus.loading());
    await Future.delayed(Duration(seconds: 3));
    await GE.post_getPosts();
  }

  void getMorePosts() async {
    serviceStatus.postStatus.updateStatus(RxStatus.loading());
    var params = {"lastId": infoService.posts.list.last.id, "amount": 5};
    await Future.delayed(Duration(seconds: 3));

    await GE.post_getPosts(params: params);
  }

  void updateWatching() async {
    var res = await GE.post_incrimentView(currentPost.id);
    if (res) {
      //update view
      currentPost.views++;
      infoService.posts.updateMap(currentPost);
      refresh();
    }
  }

  void setCurrentPost(PostModel model) {
    currentPost = model;
    updateWatching();
  }
}
