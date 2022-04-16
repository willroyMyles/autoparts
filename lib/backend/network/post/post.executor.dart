// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/backend/network/baseExecutor.dart';
import 'package:wrg3/backend/services/service.information.dart';
import 'package:wrg3/backend/services/service.status.dart';

mixin PostExecutor {
  final postPath = "/post";

  Future<dynamic> post_incrimentView(String id,
      {Map<String, dynamic>? params}) async {
    try {
      var res = await baseEx.update(postPath + "/view/$id");
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<dynamic> post_createPost(
      {dynamic data, Map<String, dynamic>? params}) async {
    if (params != null) {
      params.putIfAbsent("userId", () => infoService.userInfo.value.userId);
    } else {
      params = {};
      params.putIfAbsent("userId", () => infoService.userInfo.value.userId);
    }
    var res = await baseEx.create(postPath, data: data, params: params);
    return Future.value(res);
  }

  Future<dynamic> post_updatePost(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.update(postPath, data: data, params: params);
    return Future.value(res);
  }

  Future<dynamic> post_getPost(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.read(postPath, params: params);
    return Future.value(res);
  }

  Future<dynamic> post_getPosts(
      {dynamic data, Map<String, dynamic>? params}) async {
    final url = "/posts";
    try {
      var res = await baseEx.read(postPath + url, params: params);
      var list = _convertPosts(res);
      infoService.posts.set(list);
      serviceStatus.postStatus.updateStatus(
          list.isNotEmpty ? RxStatus.success() : RxStatus.empty());

      return Future.value(res);
    } catch (e) {
      serviceStatus.postStatus
          .updateStatus(RxStatus.error("Unable to get posts"));
      if (kDebugMode) {
        print("error");
      }
    }
  }

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
