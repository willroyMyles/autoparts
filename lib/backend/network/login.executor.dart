import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_dartio/google_sign_in_dartio.dart';
import 'package:wrg3/backend/models/model.userInfo.dart';
import 'package:wrg3/backend/services/service.information.dart';
import 'package:wrg3/backend/services/service.localStorage.dart';

import 'general.executor.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    clientId:
        "312471133667-3dp6nd9l3folfieej3qftibekf4hefa1.apps.googleusercontent.com");
mixin LoginExecutor {
  loginWithGoogle() async {
    var ans = await GoogleSignIn().signIn();
    log(ans!.toString());
    Map<String, dynamic> data = {};
    data.putIfAbsent("username", () => ans.displayName ?? "");
    data.putIfAbsent("id", () => ans.id);
    data.putIfAbsent("email", () => ans.email);
    data.putIfAbsent("userImageUrl", () => ans.photoUrl ?? "");
    data.putIfAbsent("userId", () => ans.id);
    data.putIfAbsent("alias", () => "");

    return Future.value(await signInLocally(data));
  }

  signOut() {
    _googleSignIn.signOut();
  }

  signInLocally(Map<String, dynamic> params) async {
    var ans = await GE.userInfo_CreateUserInfo(data: params);
    return Future.value(ans);
  }

  checkUserSignedIn() {
    if (serviceStorage.localStorage.hasData(StorageNames.userinfo)) {
      //info there
      //get userInfo
      UserInfo userInfo = UserInfo.fromJson(
          serviceStorage.localStorage.read(StorageNames.userinfo));
      infoService.updateUserInfo(userInfo);
    } else {
      if (kDebugMode) {
        print("info not present");
      }
    }
  }
}
