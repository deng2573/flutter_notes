import 'dart:io';
import 'dart:async';

import 'package:notes/core/utils/util_log.dart';
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
      _config = await _pullConfig('v1.0.0');
    } catch (e) {
      Log.e('pull config error');
    }
  }

  static Future<AppConfig?> _pullConfig(String version) async {
    final file = '$version-${config.channel}';
    final url =
        'https://x-zts.oss-cn-hangzhou.aliyuncs.com/appconfig/$_env/$file.json';
    final response = await Http.download(url);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data as Map<String, dynamic>;
      final config = AppConfig.fromJson(data);
      return config;
    }
    return null;
  }
}
