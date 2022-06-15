enum ApiNet {
  develop,
  test,
  uat,
  release,
}

class HttpApi {
  static ApiNet net = ApiNet.develop;

  /// 微服务接口主地址
  static String get apiHost {
    switch (net) {
      case ApiNet.develop:
        return 'http://umsudev1.niceloo.com/api/';
      case ApiNet.test:
        return 'http://umsutest.niceloo.com/api/';
      case ApiNet.uat:
        return 'http://umsuuat.niceloo.com/api/';
      default:
        return 'https://umsu.youlu.com/api/';
    }
  }

  /// 图片/文件主地址
  static String get fileHost {
    switch (net) {
      case ApiNet.develop:
        return 'http://ufiledev1.niceloo.com/api/';
      case ApiNet.test:
        return 'http://ufiletest.niceloo.com/api/';
      case ApiNet.uat:
        return 'https://ufileuat.niceloo.com/api/';
      default:
        return 'https://ufile.niceloo.com/api/';
    }
  }

  /// web 主地址 1
  static String get webHost {
    switch (net) {
      case ApiNet.develop:
        return 'http://mdev1.niceloo.com/';
      case ApiNet.test:
        return 'http://mtest.niceloo.com/';
      case ApiNet.uat:
        return 'https://muat.niceloo.com/';
      default:
        return 'https://m.niceloo.com/';
    }
  }

  /// web 主地址 2 用于课程
  static String get webCourseHost {
    switch (net) {
      case ApiNet.develop:
        return 'http://ucdev1.niceloo.com/';
      case ApiNet.test:
        return 'http://uctest.niceloo.com/';
      case ApiNet.uat:
        return 'https://ucuat.niceloo.com/';
      default:
        return 'https://uc.niceloo.com/';
    }
  }

  /// 登录验证码
  static String get captchaHost {
    switch (net) {
      case ApiNet.develop:
        return 'http://umtdev1.niceloo.com/';
      case ApiNet.test:
        return 'http://umttest.niceloo.com/';
      case ApiNet.uat:
        return 'https://umtuat.niceloo.com/';
      default:
        return 'https://umt.niceloo.com/';
    }
  }
}
