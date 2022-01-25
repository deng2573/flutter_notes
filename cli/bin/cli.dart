import 'dart:io';
import 'package:args/args.dart';
import 'package:cli/ci_config.dart';

import 'package:cli/ci_logger.dart';
import 'package:cli/ci_type.dart';
import 'package:cli/ci_script.dart';

/// 使用方式
/// flutter  pub run cli
/// --branch develop/1.0.0                                    默认：develop
/// --build  android/ios/full/1/2/3/...                       默认：android
/// flutter pub run cli --build full                          全平台全渠道打包
/// flutter pub run cli --build android                       Android全渠道打包
/// flutter pub run cli --build ios                           iOS全渠道打包
/// flutter pub run cli --branch 1.0.1 --build 4    指定分支，指定平台及渠道打包，是否签名

void main(List<String> args) async {
  try {
    // Pub Get
    await Script.pubGetProject();
    // 参数解析
    var parser = ArgParser()
      ..addOption('branch', defaultsTo: 'main')
      ..addOption('build', defaultsTo: 'full');
    ArgResults argResults = parser.parse(args);
    // 获取打包参数
    final branch = argResults['branch'];
    final build = argResults['build'];
    final type = int.tryParse(build);
    logger.i(''
        '打包：${type == null ? build : Type.values[type]}'
        '\n'
        '分支：$branch');
    await Config.init();
    // 拉取分支最新代码
    await Script.pullProject(branch);
    // 记录打包开始时间
    final begin = DateTime.now();
    // clean
    // await Script.cleanProject();
    // Pub Get
    await Script.pubGetProject();
    // 根据参数打包
    if (type != null) {
      await Script.buildProject(Type.values[type]);
    } else {
      await Future.forEach(Type.values, (Type element) async {
        if (build == 'android' && element.isAndroid) {
          await Script.buildProject(element);
        } else if (build == 'ios' && element.isIos) {
          await Script.buildProject(element);
        } else if (build == 'full') {
          await Script.buildProject(element);
        }
      });
    }
    // 记录打包结束时间
    final end = DateTime.now();
    // 计算打包时长
    final time = end.difference(begin).inSeconds;
    logger.i('总耗时：$time 秒');
    exit(0);
  } catch (e) {
    logger.i(e.toString());
  }
}
