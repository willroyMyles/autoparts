// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/models/model.answer.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/backend/network/baseExecutor.dart';
import 'package:wrg3/backend/services/service.information.dart';
import 'package:wrg3/backend/services/service.status.dart';

mixin AnswerExecutor {
  final answerPath = "/answer";

  Future<dynamic> answer_createAnswer(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.create(answerPath, data: data, params: params);
    return Future.value(res);
  }

  List<AnswerModel> _convertAnswers(dio.Response<dynamic> answers) {
    try {
      List<AnswerModel> list = [];
      for (var data in answers.data) {
        var p = AnswerModel.fromMap(data);
        list.add(p);
      }
      return list;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw "Could not convert answers";
    }
  }
}
