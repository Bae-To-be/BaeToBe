import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/images/image_tile.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/images_provider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UploadImagesScreen extends HookConsumerWidget {
  const UploadImagesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.read(imagesProvider);

    return FormLayout(
        children: [
          const SizedBox(height: 32),
          const Heading5(text: Headings.addPhotos)
              .padding(top: 32, bottom: 10, left: 15),
          Caption(
                  text: InfoLabels.addMinimumPhotos.replaceAll(
                      '%{image_count}',
                      FirebaseRemoteConfig.instance
                          .getInt(RemoteConfigs.minPhotoCount)
                          .toString()))
              .padding(left: 15, bottom: 15),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 3),
              itemCount: FirebaseRemoteConfig.instance
                  .getInt(RemoteConfigs.maxPhotoCount),
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(left: 10, right: 10),
              itemBuilder: (BuildContext ctx, index) {
                return ImageTile(position: index);
              },
            ),
          )
        ],
        floatingSubmit: FloatingCta(
          enabled: images.hasMinimumRequired(),
          onPressed: () =>
              ref.read(routerProvider).pushNamed(AppLinks.selfieVerification),
        ));
  }
}
