import 'package:dio/dio.dart';

import 'package:notes/core/http/http_exception.dart';
import 'package:notes/core/http/http_result.dart';
import 'package:notes/core/http/http_interceptor.dart';

import 'package:notes/core/utils/util_hud.dart';
import 'package:notes/core/utils/util_log.dart';

enum HttpMethod { get, post, delete, put }

class Http {
  static Http get instance => _instance;
  static final _instance = Http._();

  final Dio _client = Dio();

  Http._() {
    _client.options = BaseOptions(
      baseUrl: 'https://api.github.com',
      connectTimeout: 50000,
      receiveTimeout: 50000,
    );
    _client.interceptors.add(HttpInterceptor());
  }

  Future<HttpResult> request(
    String url, {
    bool loading = false,
    bool toast = false,
    Map<String, dynamic>? params,
    HttpMethod method = HttpMethod.post,
  }) async {
    if (loading) HUD.loading();
    final methods = ['get', 'post', 'delete', 'put'];
    _client.options.method = methods[method.index];
    try {
      final response = await _client.request(url, queryParameters: params);
      final result = HttpResult.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      final error = HttpException.getException(e);
      if (error is BusinessException) {
        if (toast) HUD.toast(msg: error.msg);
        Log.e(error.msg);
      }
      throw Exception('数据请求异常');
    } on FormatException catch (_) {
      throw const FormatException('数据解析异常');
    }
  }

  static Future<HttpResult> get(
    String url, {
    bool loading = false,
    bool toast = false,
    Map<String, dynamic>? params,
  }) async {
    return await Http.instance.request(
      url,
      loading: loading,
      toast: toast,
      params: params,
      method: HttpMethod.get,
    );
  }

  static Future<HttpResult?> post(
    String url, {
    bool loading = false,
    bool toast = false,
    Map<String, dynamic>? params,
  }) async {
    return await Http.instance.request(
      url,
      loading: loading,
      toast: toast,
      params: params,
      method: HttpMethod.post,
    );
  }

  static Future<HttpResult?> put(
    String url, {
    bool loading = false,
    bool toast = false,
    Map<String, dynamic>? params,
  }) async {
    return await Http.instance.request(
      url,
      loading: loading,
      toast: toast,
      params: params,
      method: HttpMethod.put,
    );
  }

  static Future<HttpResult?> delete(
    String url, {
    bool loading = false,
    bool toast = false,
    Map<String, dynamic>? params,
  }) async {
    return await Http.instance.request(
      url,
      loading: loading,
      toast: toast,
      params: params,
      method: HttpMethod.delete,
    );
  }

  static Future<Response> download(
    String url, {
    Map<String, dynamic>? params,
  }) async {
    return await Dio().get(url, queryParameters: params);
  }

  // static Future<UploadResult> upload(
  //     List<FileAsset> assets, Function(int count, int total) progress) async {
  //   // 上传之前,先获取上传令牌
  //   final tokenResult =
  //       await Http.post(HttpApi.apiHost + 'fs/file/upload/token');
  //   String uploadToken = '';
  //   if (tokenResult.result == '000000') {
  //     uploadToken = tokenResult.data['uploadToken'];
  //   }
  //   Map<String, dynamic> params = {'uploadToken': uploadToken};
  //   // 创建Dio实例
  //   try {
  //     FormData formData = FormData();
  //     assets.forEach((asset) {
  //       MultipartFile file = MultipartFile.fromBytes(asset.data,
  //           filename: 'file${asset.extension}',
  //           contentType: asset.extension.mediaType);
  //       formData.files.add(MapEntry('file', file));
  //     });
  //     // 创建Options实例
  //     Options options = Options(contentType: 'multipart/form-data');
  //     // 开始上传
  //     final token = GlobalUser.instance.userToken;
  //     params['token'] = token;
  //     Response response = await Http.instance().client.post(
  //           HttpApi.fileHost + 'file/upload/batch',
  //           data: formData,
  //           queryParameters: params,
  //           options: options,
  //           onSendProgress: progress,
  //         );
  //     final status = response.statusCode;
  //     final data = response.data;
  //     if (status == 200 && data != null) {
  //       UploadResult result = UploadResult.fromJson(data);
  //       result.logger();
  //       return result;
  //     }
  //     return UploadResult.serverError();
  //   } on DioError {
  //     return UploadResult.netError();
  //   }
  // }
}
