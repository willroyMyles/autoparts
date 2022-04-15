import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/services/service.information.dart';
import 'package:wrg3/frontend/pages/drawer/view.backgroundDrawer.dart';
import 'package:wrg3/frontend/pages/main/state.mainPage.dart';
import 'package:wrg3/frontend/pages/posts/view.posts.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final controller = Get.find<MainPageState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageState>(builder: (con) {
      return Stack(
        children: [
          BackgroundDrawer(),
          AnimatedPositioned(
            duration: Duration(milliseconds: 350),
            curve: Curves.easeInOutCubic,
            top: controller.showMenu ? 0 : 0,
            left: controller.showMenu ? controller.offset : 0,
            child: Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: Colors.grey.withOpacity(.2),
                    spreadRadius: 10)
              ]),
              child: Scaffold(
                floatingActionButton: InkWell(
                  onTap: () {},
                  radius: 50,
                  borderRadius: BorderRadius.circular(50),
                  splashColor: Colors.white,
                  child: Container(
                      clipBehavior: Clip.antiAlias,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Colors.transparent, width: 0),
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(.7),
                                blurRadius: 5,
                                offset: Offset(5, 5))
                          ]),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
                // bottomNavigationBar: Container(
                //   child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                //     Container(
                //       padding: EdgeInsets.all(10),
                //       margin: EdgeInsets.all(10),
                //       decoration: BoxDecoration(
                //           color: Theme.of(context).colorScheme.secondary,
                //           borderRadius: BorderRadius.circular(100)),
                //       child: Icon(CupertinoIcons.add),
                //     )
                //   ]),
                // ),
                body: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          title: Text(
                              "hello ${infoService.isSignedIn.value ? infoService.userInfo.value.username : ''}"),
                          centerTitle: false,
                          backgroundColor: Colors.transparent,
                          primary: true,
                          leading: InkWell(
                              onTap: () {
                                controller.toggleShowMenu();
                              },
                              child: Icon(CupertinoIcons.text_justifyright)),
                        )
                      ];
                    },
                    body: PostView()),
              ),
            ),
          ),
        ],
      );
    });
  }
}
