import 'package:baetobe/components/images/image_tile.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: ImageAspectRatio.ratioX / ImageAspectRatio.ratioY,
          crossAxisCount: 3),
      itemCount:
          FirebaseRemoteConfig.instance.getInt(RemoteConfigs.maxPhotoCount),
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      itemBuilder: (BuildContext ctx, index) {
        return ImageTile(position: index);
      },
    );
  }
}
