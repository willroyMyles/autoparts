import 'package:get/get.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/backend/models/model.question.dart';
import 'package:wrg3/backend/network/general.executor.dart';

class QuestionCompState extends GetxController {
  Map<String, QuestionModel> displayList = {};
  late PostModel currentPostModel;
  bool hideQuestions = false;

  getQuestions() async {
    try {
      var res =
          await GE.question_getQuestionsForPost(data: currentPostModel.id);
      for (QuestionModel model in (res as List)) {
        displayList.putIfAbsent(model.id, () => model);
      }
      refresh();
    } catch (e) {
      refresh();
    }
  }

  setCurrentPostModel(PostModel model) {
    currentPostModel = model;
    getQuestions();
  }

  toggleHideQuesions() {
    hideQuestions = !hideQuestions;
    refresh();
  }
}
