import 'dart:io';
import 'package:dio/dio.dart';
import 'package:notes/config.dart';
import 'package:notes/core/http/http_exception.dart';
import 'package:notes/core/http/http_result.dart';

class HttpInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers = {
      'VERSION': '1.1.0',
      'OS': Platform.isAndroid ? 'android' : 'ios',
      'APP_ENV': AppConfig.config.env,
      'APP_CHANNEL': AppConfig.config.channel,
    };
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.statusCode == 200) {
      final result = HttpResult.fromJson(response.data);
      if (result.code == 1000) {
        return handler.next(response);
      }
      handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          error: BusinessException(code: result.code, msg: result.msg),
        ),
      );
    }
  }
}
