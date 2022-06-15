import 'dart:convert';

// import 'package:yl_login/utils/boost.dart';
//
// class AppPlatform {
//   static Future<PlatformInfo> get platform async {
//     return await Boost.platform();
//   }
// }
//
// class PlatformInfo {
//   int memberId;
//   String baseUrl;
//   String phone;
//   String token;
//   String orgId;
//   String orgName;
//   String realName;
//   int appVersion;
//
//   PlatformInfo();
//
//   factory PlatformInfo.fromJsonString(String value) {
//     Map<String, dynamic> jsonValue = json.decode(value);
//     return PlatformInfo.fromJson(jsonValue);
//   }
//
//   PlatformInfo.fromJson(Map<String, dynamic> json)
//       : memberId = json['memberId'],
//         baseUrl = json['baseUrl'],
//         phone = json['phone'],
//         token = json['token'],
//         orgId = json['orgId'],
//         orgName = json['orgName'],
//         realName = json['realName'],
//         appVersion = json['appVersion'];
// }