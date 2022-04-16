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
}
