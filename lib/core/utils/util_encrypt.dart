import 'dart:math';
import 'package:encrypt/encrypt.dart';

class HttpEncrypt {
  static String aesKey = StringEncrypt.random();

  /// RSA加密
  static String rsaEncrypt({
    required String plainText,
    required String publicKey,
  }) {
    final dynamic key = RSAKeyParser().parse(publicKey.rsaPublicKey);
    final encrypt = Encrypter(RSA(publicKey: key));
    final encrypted = encrypt.encrypt(plainText);
    return encrypted.base64;
  }

  /// AES加密
  static String aesEncrypt({
    required String plainText,
    required String key,
  }) {
    final aesKey = Key.fromUtf8(key);
    final iv = IV.fromLength(16);
    final encrypt = Encrypter(AES(aesKey, mode: AESMode.ecb));
    final encrypted = encrypt.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  /// RSA解密
  static String rsaDecrypt({
    required String cipherText,
    required String privateKey,
  }) {
    final dynamic key = RSAKeyParser().parse(privateKey.rsaPrivateKey);
    final encrypt = Encrypter(RSA(privateKey: key));
    final encrypted = encrypt.decrypt(Encrypted.from64(cipherText));
    return encrypted;
  }

  /// AES解密
  static String aesDecrypt({
    required String cipherText,
    required String key,
  }) {
    final aesKey = Key.fromUtf8(key);
    final iv = IV.fromLength(16);
    final encrypt = Encrypter(AES(aesKey, mode: AESMode.ecb));
    final decrypted = encrypt.decrypt(Encrypted.from64(cipherText), iv: iv);
    return decrypted;
  }
}

extension StringEncrypt on String {
  static String random({
    int len = 16,
  }) {
    final random = Random();
    const characters =
        '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String value = '';
    for (int i = 0; i < len; i++) {
      final index = random.nextInt(characters.length);
      final c = characters[index];
      value += c;
    }
    return value;
  }

  String get rsaPublicKey {
    var begin = '-----BEGIN PUBLIC KEY-----\n';
    var end = '\n-----END PUBLIC KEY-----';

    final count = length ~/ 64;
    List<String> rows = [];

    for (int i = 0; i < count; i++) {
      rows.add(substring(64 * i, 64 * (i + 1)));
    }
    if (length % 64 != 0) {
      rows.add(substring(64 * count));
    }

    return begin + rows.join('\n') + end;
  }

  String get rsaPrivateKey {
    const begin = '-----BEGIN RSA PRIVATE KEY-----\n';
    const end = '\n-----END RSA PRIVATE KEY-----';

    final count = length ~/ 64;
    List<String> rows = [];

    for (int i = 0; i < count; i++) {
      rows.add(substring(64 * i, 64 * (i + 1)));
    }
    if (length % 64 != 0) {
      rows.add(substring(64 * count));
    }

    return begin + rows.join('\n') + end;
  }
}
