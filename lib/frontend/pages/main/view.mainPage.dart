import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wrg3/frontend/pages/posts/view.posts.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.transparent, width: 0),
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
                title: Text("home page"),
                backgroundColor: Colors.transparent,
                primary: true,
                leading: Icon(CupertinoIcons.text_justifyright),
              )
            ];
          },
          body: PostView()),
    );
  }
}
