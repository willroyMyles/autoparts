// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/models/model.answer.dart';
import 'package:wrg3/backend/models/model.offer.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/backend/network/baseExecutor.dart';
import 'package:wrg3/backend/services/service.information.dart';
import 'package:wrg3/backend/services/service.status.dart';

mixin OfferExecutor {
  final _offerPath = "/offer";

  Future<dynamic> offer_createoffer(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.create(_offerPath, data: data, params: params);
    return Future.value(res);
  }

  Future<dynamic> offer_getOffersForPost(String id,
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.read("$_offerPath/post/$id", params: params);
    var list = _convertoffers(res);
    return Future.value(list);
  }

  List<OfferModel> _convertoffers(dio.Response<dynamic> offers) {
    try {
      List<OfferModel> list = [];
      for (var data in offers.data) {
        var p = OfferModel.fromMap(data);
        list.add(p);
      }
      return list;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw "Could not convert offers";
    }
  }
}
