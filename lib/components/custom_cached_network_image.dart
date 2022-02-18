import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageURL;
  final String? cacheKey;
  final BoxFit fit;

  const CustomCachedNetworkImage(
      {Key? key, required this.imageURL, this.cacheKey, this.fit = BoxFit.fill})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      alignment: Alignment.topCenter,
      imageUrl: imageURL,
      cacheKey: cacheKey ?? imageURL,
      placeholderFadeInDuration: const Duration(milliseconds: 500),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
            value: downloadProgress.progress),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
