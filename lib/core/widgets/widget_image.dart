import 'package:flutter/material.dart';

import 'package:extended_image/extended_image.dart';

class CacheImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final BoxShape? shape;

  final Border? border;
  final BorderRadius? borderRadius;

  const CacheImage.url(
    this.url, {
    Key? key,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.shape = BoxShape.rectangle,
    this.border,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url,
      maxBytes: 100 * 1024,
      clearMemoryCacheWhenDispose: false,
      fit: fit,
      width: width,
      height: height,
      shape: shape,
      border: border,
      borderRadius: borderRadius,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Container(
              color: Colors.grey[100],
            );
          case LoadState.completed:
            return ExtendedRawImage(
              image: state.extendedImageInfo?.image,
              fit: BoxFit.cover,
            );
          case LoadState.failed:
            state.imageProvider.evict();
            return GestureDetector(
              child: Container(
                color: Colors.grey[100],
              ),
              onTap: () {
                state.reLoadImage();
              },
            );
        }
      },
    );
  }
}
