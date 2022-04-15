import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/extension/ext.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/backend/services/service.theme.dart';
import 'package:wrg3/frontend/pages/posts/view.postDetail.dart';

class PostItem extends StatelessWidget {
  final PostModel? model;
  final bool loading;
  const PostItem({Key? key, this.model, this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container(
        child: Text("loading"),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: themeService.br,
            border: Border.all(
              color: themeService.grey,
              width: 1,
            ),
            boxShadow: [themeService.primaryShadow]),
      );
    }
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: themeService.br,
          border: Border.all(
            color: themeService.grey,
            width: 1,
          ),
          boxShadow: [themeService.primaryShadow]),
      child: InkWell(
        onTap: () {
          Get.to(() => PostDetailView(model: model!));
        },
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: Get.width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model!.title).h1(),
                      Text(model!.category).h2(),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(model!.getCreateDate).h4(),
                    model!.status.statusText()
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Divider(
              thickness: 1,
              height: 10,
              color: themeService.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model!.make).h3(),
              Text(model!.model).h3(),
              Text(model!.year.toString()).h3(),
            ],
          )
        ]),
      ),
    );
  }
}
