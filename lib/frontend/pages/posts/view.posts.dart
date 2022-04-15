import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/enums/enum.itemType.dart';
import 'package:wrg3/backend/services/service.information.dart';
import 'package:wrg3/backend/services/service.status.dart';
import 'package:wrg3/backend/services/service.theme.dart';
import 'package:wrg3/frontend/components/genericListView.dart';
import 'package:wrg3/frontend/pages/posts/state.post.dart';

import '../../../backend/network/general.executor.dart';

class PostView extends StatelessWidget {
  PostView({Key? key}) : super(key: key);
  var con = Get.put(PostState());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostState>(builder: (controller) {
      return Container(
        // color: Colors.white,
        child: Column(children: [
          Expanded(
              child: GenericListView(
            status: serviceStatus.postStatus.status.value,
            items: infoService.posts.list,
            itemtype: Itemtype.POST,
            onRefresh: controller.getPosts,
          )),
          TextButton(
              onPressed: () async {
                controller.getPosts();
                Get.changeTheme(Get.isDarkMode
                    ? themeService.lightTheme
                    : themeService.darkTheme);
              },
              child: Text("hello worlds"))
        ]),
      );
    });
  }
}
