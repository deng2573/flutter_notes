// import 'dart:io';
// export 'dart:convert';

// import 'package:yl_common/src/http/http.dart';
// import 'package:yl_common/src/http/http_encrypt.dart';
// import 'package:yl_common/src/http/http_api.dart';
// import 'package:yl_common/src/utils/util_sp.dart';

// import 'package:yl_common/src/global/global.dart';

// class HttpHandle {
//   static Future<Map<String, dynamic>> params(
//     String url, {
//     Map<String, dynamic> params = const {},
//     bool encrypt = true,
//   }) async {
//     final token = GlobalUser.instance.userToken;
//     Map<String, dynamic> tempParams = {
//       'ctype': Platform.isIOS ? 'YOULU.APP.MAIN.IOS' : 'YOULU.APP.MAIN.ANDROID',
//       'TOKEN': token
//     };
//     Map<String, dynamic> resultParam = {};
//     if (encrypt) {
//       final rsaPublicKey = await getRSAKey();
//       final aesEncryptKey = HttpEncrypt.rsaEncrypt(
//           plainText: HttpEncrypt.aesKey, publicKey: rsaPublicKey);
//       final path = url.replaceAll(HttpApi.apiHost, '');
//       final api = {'api': path, 'params': params};
//       tempParams['apis'] = [api];
//       String paramStr = jsonEncode(tempParams);
//       String paramEncryptStr =
//           HttpEncrypt.aesEncrypt(plainText: paramStr, key: HttpEncrypt.aesKey);
//       resultParam['encryptType'] = 'RA';
//       resultParam['encryptKey'] = aesEncryptKey;
//       resultParam['encryptData'] = paramEncryptStr;
//     } else {
//       String paramStr = jsonEncode(params);
//       resultParam['params'] = paramStr;
//     }
//     return resultParam;
//   }

//   static Map<String, dynamic> response(
//     dynamic data, {
//     bool encrypt = true,
//   }) {
//     // 不加密数据处理
//     if (!encrypt) {
//       if (data is String) {
//         return jsonDecode(data);
//       } else if (data is Map) {
//         return data;
//       }
//     }
//     // 加密数据处理
//     if (data is String) {
//       String decrypt =
//           HttpEncrypt.aesDecrypt(cipherText: data, key: HttpEncrypt.aesKey);
//       if (decrypt != null) {
//         List decryptMap = jsonDecode(decrypt);
//         return decryptMap.first;
//       }
//     } else if (data is Map) {
//       return data;
//     }
//     return null;
//   }

//   static Future<void> error(HttpResult result) async {
//     switch (result.result) {
//       case 'GB2004':
//         // 未登录
//         // await AppChannel.notLogin();
//         break;
//       case 'GB2006':
//         // TOKEN失效
//         // await AppChannel.tokenInvalid(result.msg ?? '');
//         break;
//       case 'GB2009':
//         // 验证码错误或已失效
//         break;
//       case 'GB2010':
//         // 需要身份验证
//         break;
//       case 'GB2011':
//         // 身份认证失败
//         break;
//       case 'GB2031':
//         // 请求被风控拦截
//         break;
//     }
//   }

//   static Future<String> getRSAKey() async {
//     final localRSAKey = await Sp.get<String>('RSAPublicKey');
//     if (localRSAKey != null) {
//       return localRSAKey;
//     }
//     HttpResult result = await Http.post(EntryApi.rsaKey, encrypt: false);
//     if (result.data != null) {
//       final netRSAKey = RSAPublicKey.fromJson(result.data).key;
//       await Sp.save('RSAPublicKey', netRSAKey);
//       return netRSAKey;
//     }
//     return null;
//   }

//   /// 移除本地 RSAPublicKey
//   static Future<void> cleanRSAKey() async {
//     await Sp.remove('RSAPublicKey');
//   }
// }

// class EntryApi {
//   static String get rsaKey => HttpApi.apiHost + 'sc/rsa/publickey';
// }

// class RSAPublicKey {
//   String key;

//   RSAPublicKey({this.key});

//   RSAPublicKey.fromJson(Map<String, dynamic> json) {
//     key = json['publickey'];
//   }
// }
