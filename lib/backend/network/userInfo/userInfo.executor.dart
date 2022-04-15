// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/backend/models/model.userInfo.dart';
import 'package:wrg3/backend/network/baseExecutor.dart';
import 'package:wrg3/backend/services/service.information.dart';

mixin UserInfoExecutor {
  final path = "/user-info";

  // Future<dynamic>  userInfo_GetUserInfo_CreateUserInfoIfDoesNotExsis(dynamic data) async {
  //   try{
  //   var res = await baseEx.read(path)
  //   var res = await baseEx.create(path, data: data, params: params);
  //   return Future.value(res);
  //   }catch(e){

  //   }
  // }

  @protected
  Future<dynamic> userInfo_CreateUserInfo(
      {dynamic data, Map<String, dynamic>? params}) async {
    try {
      var res = await baseEx.create(path, data: data, params: params);
      var userInfo = _convertUserInfo(res);
      infoService.updateUserInfo(userInfo);
      return Future.value(true);
    } catch (e) {
      print("unable to log in $e");
      infoService.updateUserInfo(null);
      return Future.value(false);
    }
  }

  @protected
  Future<dynamic> userInfo_UpdateUserInfo(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.update(path, data: data, params: params);
    return Future.value(res);
  }

  @protected
  Future<dynamic> userInfo_GetUserInfo(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.read(path, params: params);
    return Future.value(res);
  }

  @protected
  Future<dynamic> userInfo_DeleteUserInfo(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.delete(path, data: data, params: params);
    return Future.value(res);
  }

  UserInfo _convertUserInfo(dio.Response<dynamic> userInfo) {
    try {
      var p = UserInfo.fromMap(userInfo.data);

      return p;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw "Could not convert userInfo";
    }
  }
}
