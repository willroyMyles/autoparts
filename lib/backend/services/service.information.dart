import 'package:get/get.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/backend/models/model.userInfo.dart';
import 'package:wrg3/backend/services/service.localStorage.dart';

class InformationService {
  RxObject<PostModel> posts = RxObject({});
  Rx<UserInfo> userInfo = UserInfo.empty().obs;
  RxBool isSignedIn = false.obs;

  updateUserInfo(UserInfo? userInfo) {
    if (userInfo != null) {
      isSignedIn.value = true;
      this.userInfo.value = userInfo;

      serviceStorage.localStorage.write(StorageNames.isSignedIn, true);
      serviceStorage.localStorage
          .write(StorageNames.userinfo, userInfo.toJson());
    } else {
      isSignedIn.value = false;
      serviceStorage.localStorage.write(StorageNames.isSignedIn, false);
      serviceStorage.localStorage.remove(StorageNames.userinfo);
    }

    isSignedIn.refresh();
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
