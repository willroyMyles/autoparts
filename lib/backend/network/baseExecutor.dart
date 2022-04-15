import 'package:dio/dio.dart';

String get getBaseUrl =>
    "https://d527-2605-a200-9501-bd6a-7c16-e360-7f3e-2e.ngrok.io".trim();

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
