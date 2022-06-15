class HttpResult {
  final int code;
  final String msg;
  final dynamic data;

  HttpResult({
    required this.code,
    required this.msg,
    required this.data,
  });

  factory HttpResult.fromJson(Map<String, dynamic> json) {
    return HttpResult(
      code: json['code'] as int? ?? 0,
      msg: json['msg'] as String? ?? '',
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'msg': msg,
      'data': data.toString(),
    };
  }
}
