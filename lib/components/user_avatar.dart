import 'package:baetobe/entities/generated/user_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double radius;
  final UserImage? image;

  const UserAvatar({Key? key, this.image, this.radius = 50}) : super(key: key);

  Widget imageView() {
    if (image == null) {
      return Image.asset('assets/profile_placeholder.png',
          height: radius, width: radius, fit: BoxFit.cover);
    } else {
      return CachedNetworkImage(
        fit: BoxFit.cover,
        height: radius,
        width: radius,
        imageUrl: image!.url,
        cacheKey: image!.id.toString(),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
                value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: imageView(),
    );
  }
}
