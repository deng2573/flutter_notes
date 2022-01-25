import 'dart:io';
import 'package:process_run/shell.dart';

import 'package:cli/ci_type.dart';
import 'package:cli/ci_config.dart';
import 'package:cli/ci_logger.dart';

String pullCommand({String branch = 'main'}) {
  return 'git -c color.branch=false -c color.diff=false -c color.status=false -c diff.mnemonicprefix=false -c core.quotepath=false -c credential.helper=sourcetree pull --no-commit origin $branch';
}

String checkoutCommand({String branch = 'main', isExist}) {
  return 'git --no-optional-locks -c color.branch=false -c color.diff=false -c color.status=false -c diff.mnemonicprefix=false -c core.quotepath=false -c credential.helper=sourcetree checkout ${isExist ? branch : '-b $branch --track origin/$branch'}';
}

class Script {
  static final shell = Shell().cd(Config.project);

  static Future<void> pullProject(String branch) async {
    final remoteBranch = await shell.run('git branch -r');
    final remoteList = remoteBranch.outLines
        .toList()
        .map((e) => e.replaceAll(RegExp(r'\s+\b|\b\s'), ''));
    if (!remoteList.contains('origin/$branch')) {
      throw Exception('远程$branch分支未找到');
    }
    final currentBranch = await shell.run(
      'git rev-parse --abbrev-ref HEAD',
    );
    logger.i('当前分支--${currentBranch.outText}');
    if (currentBranch.outText != branch) {
      final localBranch = await shell.run('git branch');
      final localList = localBranch.outLines
          .toList()
          .map((e) => e.replaceAll(RegExp(r'\s+\b|\b\s'), ''));
      await shell.run(
        checkoutCommand(branch: branch, isExist: localList.contains(branch)),
      );
    }
    await shell.run(pullCommand(branch: branch));
  }

  static Future<void> cleanProject() async {
    await shell.run('flutter clean');
    await shell.run('flutter pub get');
  }

  static Future<void> buildProject(Type type) async {
    logger.i('开始打包--$type--${Config.appName}');
    await shell.run(type.command);
    if (type.isIos) {
      Directory iosBuildDirectory = Directory(
          Directory.current.path + '/cli/build/ios/${Config.version}');
      String archiveName = '${Config.appName}_${type.env}.xcarchive';
      Directory iosPath = Directory(iosBuildDirectory.path + '/$archiveName');
      if (!await iosBuildDirectory.exists()) {
        await iosBuildDirectory.create(recursive: true);
      }
      if (await iosPath.exists()) {
        await iosPath.delete(recursive: true);
      }
      await Directory('${Config.project}/build/ios/archive/Runner.xcarchive')
          .rename(iosPath.path);
    } else {
      Directory androidBuildDirectory = Directory(
          Directory.current.path + '/cli/build/android/${Config.version}');
      String apkName = '${Config.appName}_${type.env}.apk';
      File apkPath = File(androidBuildDirectory.path + '/$apkName');
      if (!await androidBuildDirectory.exists()) {
        await androidBuildDirectory.create(recursive: true);
      }
      if (await apkPath.exists()) {
        await apkPath.delete(recursive: true);
      }
      File('${Config.project}/build/app/outputs/flutter-apk/app-release.apk')
          .rename(apkPath.path);
    }
  }
}
