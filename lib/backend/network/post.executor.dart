import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/backend/network/baseExecutor.dart';
import 'package:wrg3/backend/services/service.information.dart';

mixin PostExecutor {
  final path = "/post";

  @protected
  Future<dynamic> postCreatePost(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.create(path, data: data, params: params);
    return Future.value(res);
  }

  @protected
  Future<dynamic> postUpdatePost(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.update(path, data: data, params: params);
    return Future.value(res);
  }

  @protected
  Future<dynamic> postGetPost(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.read(path, params: params);
    return Future.value(res);
  }

  @protected
  Future<dynamic> postGetPosts(
      {dynamic data, Map<String, dynamic>? params}) async {
    final url = "/posts";
    try {
      var res = await baseEx.read(path + url, params: params);
      var list = _convertPosts(res);
      infoService.posts.set(list);
      return Future.value(res);
    } catch (e) {
      if (kDebugMode) {
        print("error");
      }
    }
  }

  @protected
  Future<dynamic> postDeletePost(
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await baseEx.delete(path, data: data, params: params);
    return Future.value(res);
  }

  List<PostModel> _convertPosts(Response<dynamic> posts) {
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
