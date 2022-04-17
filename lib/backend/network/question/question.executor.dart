import 'package:dio/dio.dart';
import 'package:wrg3/backend/models/model.question.dart';
import 'package:wrg3/backend/network/baseExecutor.dart';

mixin QuestionExecutor {
  final String questionPath = "/question";

  Future<dynamic> question_createQuestion(
      {dynamic data, Map<String, dynamic>? params}) async {
    try {
      var res = await baseEx.create(questionPath, data: data, params: params);
      return Future.value(res);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }

  Future<dynamic> question_getQuestionsForPost(
      {dynamic data, Map<String, dynamic>? params}) async {
    try {
      var res = await baseEx.read("$questionPath/post/$data", params: params);
      var ans = _convertQuestions(res);
      return Future.value(ans);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }

  List<QuestionModel> _convertQuestions(Response<dynamic> data) {
    List<QuestionModel> list = [];
    for (var item in data.data) {
      QuestionModel mod = QuestionModel.fromMap(item);
      list.add(mod);
    }
    return list;
  }
}
