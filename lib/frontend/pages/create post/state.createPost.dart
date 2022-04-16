import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/network/general.executor.dart';
import 'package:wrg3/backend/services/service.carData.dart';

class CreatePostState extends GetxController {
  Map<String, TextEditingController> controls = {};
  final formKey = GlobalKey<FormState>();

  int make = 0;
  int model = -1;

  List<int> yearList =
      List.generate(100, (index) => DateTime.now().year - index);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controls.putIfAbsent("title", () => TextEditingController());
    controls.putIfAbsent("content", () => TextEditingController());
    controls.putIfAbsent("make", () => TextEditingController());
    controls.putIfAbsent("model", () => TextEditingController());
    controls.putIfAbsent("year", () => TextEditingController());
    controls.putIfAbsent("category", () => TextEditingController());
  }

  setMake(int make) {
    this.make = make;
    controls["make"]!.text = serviceCarData.makes.elementAt(make).toString();
    refresh();
  }

  setModel(int model) {
    this.model = model;
    controls["model"]!.text =
        serviceCarData.getModels(make).elementAt(model).toString();
    refresh();
  }

  setYear(int index) {
    controls["year"]!.text = yearList.elementAt(index).toString();
    refresh();
  }

  setCategory(int index) {
    controls["category"]!.text =
        serviceCarData.category.elementAt(index).toString();
    refresh();
  }

  clearAll() {
    controls.forEach((key, value) {
      value.clear();
    });
    refresh();
  }

  onSubmit() async {
    var ans = formKey.currentState!.validate();
    if (!ans) throw "fields cannot be empty";
    var map = {
      "title": controls["title"]!.text,
      "content": controls["content"]!.text,
      "category": controls["category"]!.text,
      "make": controls["make"]!.text,
      "model": controls["model"]!.text,
      "year": int.tryParse(controls["year"]!.text),
    };
    await GE.post_createPost(data: map);
  }

  @override
  void onClose() {
    super.onClose();
    controls.forEach((key, value) {
      value.dispose();
    });
  }
}
