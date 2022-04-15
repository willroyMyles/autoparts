import 'package:dio/dio.dart';

String get getBaseUrl =>
    "https://da6b-2605-a200-9501-bd6a-78f1-30b0-bd4b-9e6.ngrok.io";

class BaseExecutor {
  final dio = Dio(BaseOptions(baseUrl: getBaseUrl, headers: {}));

  Future<Response<dynamic>> create(String path,
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await dio.post(path, data: data, queryParameters: params);
    return Future.value(res);
  }

  Future<Response<dynamic>> update(String path,
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await dio.patch(path, data: data, queryParameters: params);
    return Future.value(res);
  }

  Future<Response<dynamic>> read(String path,
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await dio.get(path, queryParameters: params);
    return Future.value(res);
  }

  Future<Response<dynamic>> delete(String path,
      {dynamic data, Map<String, dynamic>? params}) async {
    var res = await dio.delete(path, data: data, queryParameters: params);
    return Future.value(res);
  }
}

BaseExecutor baseExecutor = BaseExecutor();
BaseExecutor get baseEx => baseExecutor;
