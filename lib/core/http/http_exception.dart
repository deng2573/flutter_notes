import 'package:dio/dio.dart';

class HttpException {
  static HttpException? getException(dynamic error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.other:
          return BusinessException(
            code: error.error.code,
            msg: error.error.message,
          );
        default:
          return BusinessException(
            code: error.error.code,
            msg: '网络异常，请稍后重试',
          );
      }
    }
    return null;
  }
}

class BusinessException implements HttpException {
  final int code;
  final String msg;

  BusinessException({
    required this.code,
    required this.msg,
  });

  factory BusinessException.fromJson(Map<String, dynamic> json) {
    return BusinessException(
      code: json['code'] as int? ?? 0,
      msg: json['msg'] as String? ?? '',
    );
  }
}

class ServerException implements HttpException {
  final int code;
  final String msg;

  ServerException({
    required this.code,
    required this.msg,
  });

  factory ServerException.fromJson(Map<String, dynamic> json) {
    return ServerException(
      code: json['code'] as int? ?? 0,
      msg: json['msg'] as String? ?? '',
    );
  }
}
