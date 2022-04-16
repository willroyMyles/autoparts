import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/network/general.executor.dart';
import 'package:wrg3/backend/services/service.information.dart';
import 'package:wrg3/frontend/pages/login/view.login.dart';
import 'package:wrg3/frontend/pages/main/state.mainPage.dart';

class BackgroundDrawer extends StatelessWidget {
  BackgroundDrawer({Key? key}) : super(key: key);
  final mainController = Get.find<MainPageState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(1),
      body: Container(
        width: mainController.offset,
        // alignment: Alignment.center,
        decoration: BoxDecoration(
            // color: Theme.of(context).colorScheme.secondary.withBlue(200)
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("logo"),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: InkWell(
                          onTap: () {
                            mainController.toggleShowMenu();
                          },
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Icon(CupertinoIcons.clear))))
                ],
              ),
            ),
            Spacer(),
            ListTile(
              onTap: () {},
              title: Text("feedback"),
              hoverColor: Colors.white,
              subtitle: Text("leave feedback"),
              leading: Icon(Icons.feedback_outlined),
              horizontalTitleGap: 2,
            ),
            Spacer(),
            if (!infoService.isSignedIn.value)
              ListTile(
                onTap: () {
                  Get.to(() => LoginView());
                },
                title: Text("login"),
                hoverColor: Colors.white,
                subtitle: Text("click to login"),
                leading: Icon(Icons.login),
                horizontalTitleGap: 2,
              ),
            if (infoService.isSignedIn.value)
              ListTile(
                onTap: () {
                  GE.signOut();
                },
                title: Text("log out"),
                hoverColor: Colors.white,
                subtitle: Text("click to sign out"),
                leading: Icon(Icons.logout_outlined),
                horizontalTitleGap: 2,
              )
          ],
        ),
      ),
    );
  }
}
