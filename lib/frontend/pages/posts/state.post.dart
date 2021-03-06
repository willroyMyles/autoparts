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
import 'package:wrg3/frontend/components/alertBox.dart';
import 'package:wrg3/frontend/components/bottomSheetCloseButton.dart';
import 'package:wrg3/frontend/components/expandingButton.dart';
import 'package:wrg3/frontend/pages/components/offer/state.offerComp.dart';
import 'package:wrg3/frontend/pages/components/question/state.questionComp.dart';

import '../../../backend/network/general.executor.dart';
import '../../components/buttonWithStatus.dart';

class PostState extends GetxController with CSM {
  late PostModel currentPost;

  shouldRefresh() {
    refresh();
  }

  makeAnOffer() async {
    Get.close(1);
    TextEditingController tec = TextEditingController();

    Get.dialog(AlertBox(
        promptText: "write your offer here",
        tec: tec,
        callback: () async {
          var map = {
            "message": tec.text,
            "postId": currentPost.id,
            "senderId": infoService.userInfo.value.id,
            "recieverId": currentPost.userInfo!.id
          };
          var ques = await GE.offer_createoffer(data: map);
          OfferCompState offerState = Get.find();

          offerState.displayList.putIfAbsent(ques.id, () => ques);
          offerState.refresh();
        }));
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
    Get.dialog(AlertBox(
        promptText: "write your question here",
        tec: tec,
        callback: () async {
          var map = {
            "content": tec.text,
            "postId": currentPost.id,
            "userInfoId": infoService.userInfo.value.id
          };
          var ques = await GE.question_createQuestion(data: map);
          QuestionCompState questionCompState = Get.find();

          questionCompState.displayList.putIfAbsent(ques.id, () => ques);
          questionCompState.refresh();
        }));
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
