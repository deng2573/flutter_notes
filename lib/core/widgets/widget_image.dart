import 'package:flutter/material.dart';

import 'package:extended_image/extended_image.dart';

class CacheImage extends StatelessWidget {
  final String url;

  const CacheImage.url(
    this.url, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url,
      maxBytes: 100 * 1024,
      clearMemoryCacheWhenDispose: false,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Container(
              color: Colors.grey[100],
            );
          case LoadState.completed:
            return ExtendedRawImage(
              image: state.extendedImageInfo?.image,
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
