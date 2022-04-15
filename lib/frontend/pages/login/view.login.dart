import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/network/general.executor.dart';
import 'package:wrg3/frontend/components/squareButton.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SquareButton(
                  small: true,
                  text: "login with google",
                  iconData: Icons.login,
                  callback: () async {
                    var res = await GE.loginWithGoogle();
                    if (res) {
                      Get.back();
                    } else {
                      Get.snackbar("Oh My!", "didn't login");
                    }
                  }),
              Text("choose a login option")
            ]),
      ),
    );
  }
}
