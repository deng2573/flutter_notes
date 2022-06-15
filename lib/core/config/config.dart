import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:notes/core/http/http_manager.dart';

const _env = String.fromEnvironment(
  'APP_ENV',
  defaultValue: 'develop',
);

const _channel = String.fromEnvironment(
  'APP_CHANNEL',
  defaultValue: 'default',
);

const bool _isDevelop = _env == 'develop';
const bool _isStage = _env == 'stage';

class AppConfig {
  final String ossUrl;
  final String baseUrl;
  final String channel;
  //微信
  final String wechatAppID;
  final String universalLink;
  //极光推送
  final String jpushAppKey;
  //友盟
  final String umengIosAppKey;
  final String umengAndroidAppKey;

  String get env => _env;

  AppConfig({
    required this.baseUrl,
    required this.ossUrl,
    required this.channel,
    required this.wechatAppID,
    required this.universalLink,
    required this.jpushAppKey,
    required this.umengAndroidAppKey,
    required this.umengIosAppKey,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      ossUrl: json['ossUrl'] as String? ?? _default.ossUrl,
      baseUrl: json['baseUrl'] as String? ?? _default.baseUrl,
      channel: json['channel'] as String? ?? _default.channel,
      wechatAppID: json['wechatAppID'] as String? ?? _default.wechatAppID,
      universalLink: json['universalLink'] as String? ?? _default.universalLink,
      jpushAppKey: json['jpushAppKey'] as String? ?? _default.jpushAppKey,
      umengIosAppKey:
          json['umengIosAppKey'] as String? ?? _default.umengIosAppKey,
      umengAndroidAppKey:
          json['umengAndroidAppKey'] as String? ?? _default.umengAndroidAppKey,
    );
  }

  static final _develop = AppConfig(
    ossUrl: 'http://lie-res.dev.huidutek.com',
    baseUrl: 'http://lieapi.dev.huidutek.com:7001',
    channel: _channel,
    wechatAppID: 'wx1d019d511df9be22',
    universalLink: 'https://lie.huidutek.com',
    jpushAppKey: '',
    umengIosAppKey: '',
    umengAndroidAppKey: '',
  );

  static final _stage = AppConfig(
    ossUrl: 'http://lie-res.dev.huidutek.com',
    baseUrl: 'http://lieapi.dev.huidutek.com:7001',
    channel: _channel,
    wechatAppID: 'wx1d019d511df9be22',
    universalLink: 'https://lie.huidutek.com',
    jpushAppKey: '',
    umengIosAppKey: '',
    umengAndroidAppKey: '',
  );

  static final _prod = AppConfig(
    ossUrl: 'http://lie-res.dev.huidutek.com',
    baseUrl: 'http://lieapi.dev.huidutek.com:7001',
    channel: _channel,
    wechatAppID: 'wx1d019d511df9be22',
    universalLink: 'https://lie.huidutek.com',
    jpushAppKey: '',
    umengIosAppKey: '',
    umengAndroidAppKey: '',
  );

  static final _default = _isDevelop ? _develop : (_isStage ? _stage : _prod);

  static AppConfig get config => _config ?? _default;

  static AppConfig? _config;

  static Future<void> init() async {
    try {
      _config = await _pullConfig('v1.1.2');
    } catch (e) {
      print('pull config error: $e');
    }
  }

  static Future<AppConfig?> _pullConfig(String version) async {
    final file = '$version-${config.channel}.json';
    final uri = Uri.https(
      'res.x-zts.com',
      'appconfig/$_env/$file.json',
    );
    final response = await Http.download('$uri');
    if (response.statusCode == HttpStatus.ok) {
      final responseBody = utf8.decode(response.data);
      final data = json.decode(responseBody) as Map<String, dynamic>;
      final config = AppConfig.fromJson(data);
      return config;
    }
    return null;
  }

  // static Future<void> loadConfig({Completer<void>? completer}) async {
  //   completer ??= Completer<void>();
  //   try {
  //     final connectivityResult = await Connectivity().checkConnectivity();
  //     if (connectivityResult == ConnectivityResult.none) {
  //       lieDialog(
  //         title: '网络不可用',
  //         middleText: '网络不可用，请检查您的网络，并重试。',
  //         textConfirm: '重试',
  //         onConfirm: () async {
  //           Get.back();
  //           loadConfig(completer: completer);
  //         },
  //       );
  //       return completer.future;
  //     }
  //     await AppConfig.init(Application.packageInfo);
  //     completer.complete();
  //   } catch (e) {
  //     await lieDialog(
  //       title: '网络错误',
  //       middleText: '网络错误，请检查您的网络，并重试。',
  //       textConfirm: '重试',
  //       onConfirm: () async {
  //         Get.back();
  //         loadConfig(completer: completer);
  //       },
  //     );
  //   }
  //   return completer.future;
  // }
}
