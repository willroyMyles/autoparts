import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/backend/network/baseExecutor.dart';
import 'package:wrg3/backend/services/service.information.dart';
import 'package:wrg3/backend/services/service.status.dart';

mixin PostExecutor {
  final postPath = "/post";

  @protected
  Future<dynamic> postCreatePost(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.create(postPath, data: data, params: params);
    return Future.value(res);
  }

  @protected
  Future<dynamic> postUpdatePost(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.update(postPath, data: data, params: params);
    return Future.value(res);
  }

  @protected
  Future<dynamic> postGetPost(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.read(postPath, params: params);
    return Future.value(res);
  }

  @protected
  Future<dynamic> postGetPosts(
      {dynamic data, Map<String, dynamic>? params}) async {
    final url = "/posts";
    try {
      var res = await baseEx.read(postPath + url, params: params);
      var list = _convertPosts(res);
      infoService.posts.set(list);
      serviceStatus.postStatus.updateStatus(RxStatus.success());

      return Future.value(res);
    } catch (e) {
      serviceStatus.postStatus
          .updateStatus(RxStatus.error("Unable to get posts"));
      if (kDebugMode) {
        print("error");
      }
    }
  }

  @protected
  Future<dynamic> postDeletePost(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.delete(postPath, data: data, params: params);
    return Future.value(res);
  }

  List<PostModel> _convertPosts(dio.Response<dynamic> posts) {
    try {
      List<PostModel> list = [];
      for (var data in posts.data) {
        var p = PostModel.fromMap(data);
        list.add(p);
      }
      return list;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw "Could not convert posts";
    }
  }
}
