import 'package:get/get.dart';

class MainPageState extends GetxController {
  bool showMenu = false;
  double offset = Get.width / 1.3;

  toggleShowMenu() {
    showMenu = !showMenu;
    refresh();
  }
}
