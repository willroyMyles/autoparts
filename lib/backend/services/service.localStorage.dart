import 'package:get_storage/get_storage.dart';

class LocalStorage {
  GetStorage localStorage = GetStorage(StorageNames.local);

  LocalStorage() {
    setup();
  }

  setup() async {
    // await localStorage.initStorage;
    print(localStorage.getKeys());
  }
}

LocalStorage _localStorage = LocalStorage();
LocalStorage get serviceStorage => _localStorage;

class StorageNames {
  static final String isSignedIn = "isSignedIn";
  static final String userinfo = "userinfo";
  static final String local = "local";
}
