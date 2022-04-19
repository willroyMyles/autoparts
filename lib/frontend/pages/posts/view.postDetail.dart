import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/extension/ext.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/backend/services/service.theme.dart';
import 'package:wrg3/frontend/components/bottomSheet.dart';
import 'package:wrg3/frontend/components/buttonWithStatus.dart';
import 'package:wrg3/frontend/pages/components/offer/view.offerComp.dart';
import 'package:wrg3/frontend/pages/components/question/view.questionComp.dart';
import 'package:wrg3/frontend/pages/posts/state.post.dart';

class PostDetailView extends StatelessWidget {
  final PostModel model;
  PostDetailView({Key? key, required this.model}) : super(key: key);
  final controller = Get.find<PostState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GetBuilder<PostState>(
        init: controller,
        initState: (_) {
          controller.setCurrentPost(model);
        },
        builder: (_) {
          return FloatingActionButton(
            onPressed: () async {
              var ans = await Get.bottomSheet(
                  BottomSheetCustom(
                    child: controller.getBottomSheet(),
                  ),
                  isScrollControlled: false,
                  ignoreSafeArea: true,
                  isDismissible: true);
              if (kDebugMode) {
                print(ans);
              }
            },
            child: Icon(Icons.menu),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            tooltip: "Options",
            disabledElevation: 0,
            elevation: 10,
            focusElevation: 15,
          );
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      // bottomNavigationBar: Container(
      //   child: Container(
      //     height: 55,
      //     // padding: EdgeInsets.all(15),
      //     // margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      //     alignment: Alignment.bottomCenter,
      //     decoration: BoxDecoration(
      //         color: themeService.bgColor,
      //         borderRadius: themeService.br,
      //         border: Border.all(color: themeService.grey, width: 3)),
      //     child: Row(
      //       children: [
      //         Container(
      //             child: TextButton(
      //                 onPressed: () {}, child: Text("ask a question"))),
      //         Container(
      //             child: TextButton(
      //                 onPressed: () {}, child: Text("start watching"))),
      //         Container(
      //             child: TextButton(
      //                 onPressed: () {}, child: Text("make an offer"))),
      //       ],
      //     ),
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(model.title),
            elevation: 0,
            floating: true,
            primary: true,
            backgroundColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
              child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
            decoration: BoxDecoration(
                color: themeService.bgColor,
                borderRadius: themeService.br,
                border: Border.all(color: themeService.grey, width: 2),
                boxShadow: [themeService.primaryShadow]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(model.title).h1(),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(model.content).h2(),
              ),
              Divider(),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(model.make).h3(),
                    Text(model.model).h3(),
                    Text(model.year.toString()).h3(),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(model.category).h3(),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("status : ").h3(),
                          model.status.statusText(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          )),
          GetBuilder<PostState>(builder: (_) {
            return SliverAppBar(
              primary: false,
              toolbarHeight: 65,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              title: Opacity(
                opacity: .7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 0),
                      width: 55,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${model.watching}",
                            textScaleFactor: .8,
                          ),
                          Icon(CupertinoIcons.eyeglasses),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      width: 55,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${model.views}",
                            textScaleFactor: .8,
                          ),
                          Icon(CupertinoIcons.eye),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 0),
                      width: 55,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.0),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                color: Colors.black.withOpacity(.0))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${model.commentss}",
                            textScaleFactor: .8,
                          ),
                          Icon(CupertinoIcons.chat_bubble),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          // SliverAppBar(
          //   automaticallyImplyLeading: false,
          //   primary: false,
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   title: Container(
          //     margin: EdgeInsets.only(top: 15),
          //     child:
          //         Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //       TextButton(onPressed: () {}, child: Text("watch")),
          //       SizedBox(
          //         width: 40,
          //       ),
          //       TextButton(onPressed: () {}, child: Text("comment")),
          //     ]),
          //   ),
          // ),

          SliverToBoxAdapter(
            child: QuestionComponent(
              model: model,
            ),
          ),

          SliverToBoxAdapter(
            child: OfferComp(model: model),
          ),

          SliverPadding(padding: EdgeInsets.symmetric(vertical: 50))
        ],
      ),
    );
  }
}
