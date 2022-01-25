enum Type {
  iosLocal,
  iosStage,
  iosProd,
  androidLocal,
  androidStage,
  androidProd,
}

extension TypeExt on Type {
  bool get isIos {
    switch (this) {
      case Type.iosProd:
      case Type.iosLocal:
      case Type.iosStage:
        return true;
      default:
        return false;
    }
  }

  bool get isAndroid {
    return !isIos;
  }

  bool get isProd {
    return env == 'prod';
  }

  bool get isStage {
    return env == 'stage';
  }

  bool get isLocal {
    return env == 'local';
  }

  String get env {
    switch (this) {
      case Type.iosLocal:
      case Type.androidLocal:
        return 'local';
      case Type.iosStage:
      case Type.androidStage:
        return 'stage';
      default:
        return 'prod';
    }
  }

  String get channel {
    switch (this) {
      case Type.iosLocal:
      case Type.androidLocal:
        return 'local';
      case Type.iosStage:
      case Type.androidStage:
        return 'stage';
      case Type.iosProd:
        return 'ios';
      case Type.androidProd:
        return 'android';
    }
  }

  String get command {
    final android = 'flutter build apk';
    final ios = 'flutter build ipa';
    final args = ' --obfuscate'
        ' --split-debug-info=build/app/outputs/symbols'
        ' --dart-define APP_ENV=$env --dart-define APP_CHANNEL=$channel';
    return (isAndroid ? android : ios) + args;
  }
}
