import 'package:get/get.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/backend/models/model.userInfo.dart';

class InformationService {
  RxObject<PostModel> posts = RxObject({});
  Rx<UserInfo> userInfo = UserInfo.empty().obs;
  RxBool isSignedIn = false.obs;

  updateUserInfo(UserInfo? userInfo) {
    if (userInfo != null) {
      isSignedIn.value = true;
      this.userInfo.value = userInfo;
    } else {
      isSignedIn.value = false;
    }
  }
}

InformationService _informationService = InformationService();
InformationService get infoService => _informationService;

class RxObject<T> extends Rx<Map<dynamic, dynamic>> {
  RxObject(Map initial) : super(initial);

  set(List<dynamic> list) {
    value.clear();
    for (var item in list) {
      value.update(
        item.id,
        (value) => item,
        ifAbsent: () => item,
      );
    }
    announce();
  }

  void updateMap(dynamic model) {
    if (!value.containsKey(model.id)) {
      value.putIfAbsent(model.id, () => model);
    }
    refresh();
  }

  clear() {
    value.clear();
    announce();
  }

  announce() => refresh();

  List<T> get list => List<T>.from(value.values.toList());
}
