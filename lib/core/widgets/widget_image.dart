import 'package:flutter/material.dart';

import 'package:extended_image/extended_image.dart';

class Image extends StatelessWidget {
  final String? url;
  // final OnImageCallback? onImage;
  // final OnLoadCallback? onLoad;
  // final List<Widget> slivers;

  const Image({
    Key? key,
    this.url,
    // this.onImage,
    // this.onLoad,
    // required this.slivers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url ?? '',
      // width: ScreenUtil.instance.setWidth(400),
      // height: ScreenUtil.instance.setWidth(400),
      fit: BoxFit.fill,
      cache: true,
      //cancelToken: cancellationToken,
    );
  }
}
