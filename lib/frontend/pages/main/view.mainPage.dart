import 'package:flutter/material.dart';
import 'package:wrg3/frontend/pages/posts/view.posts.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text("home page"),
              )
            ];
          },
          body: PostView()),
    );
  }
}
