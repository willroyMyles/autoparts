import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wrg3/backend/network/general.executor.dart';
import 'package:wrg3/backend/services/service.carData.dart';
import 'package:wrg3/backend/services/service.localStorage.dart';
import 'package:wrg3/backend/services/service.theme.dart';
import 'package:wrg3/frontend/pages/main/state.mainPage.dart';
import 'package:wrg3/frontend/pages/main/view.mainPage.dart';
import 'package:google_sign_in_dartio/google_sign_in_dartio.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final con = Get.put(MainState());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: themeService.lightTheme,
        // darkTheme: themeService.darkTheme,
        home: MainPage());
  }
}

class MainState extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => MainPageState());
    setUp();
  }

  setUp() async {
    if (GetPlatform.isDesktop) {
      GoogleSignInDart.register(
          clientId:
              "312471133667-3dp6nd9l3folfieej3qftibekf4hefa1.apps.googleusercontent.com");
      print("registered google client id");
    }

    await GetStorage.init(StorageNames.local);
    GE.checkUserSignedIn();
    print(serviceCarData.makes);
  }
}
