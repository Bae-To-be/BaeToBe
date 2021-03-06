import 'package:baetobe/components/bottomsheet_utils.dart';
import 'package:baetobe/components/custom_divider.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/form_states/image_state_provider.dart';
import 'package:baetobe/domain/images_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:styled_widget/styled_widget.dart';

class ImageTile extends HookConsumerWidget {
  final int position;

  const ImageTile({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(imageStateProvider(position));

    if (state.loading) {
      return Center(
        child: CircularProgressIndicator(color: Theme.of(context).primaryColor)
            .padding(all: 24),
      );
    }

    if (state.url != null) {
      return Stack(
        children: <Widget>[
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio:
                    FirebaseRemoteConfig.instance.getInt('ASPECT_RATIO_X') /
                        FirebaseRemoteConfig.instance.getInt('ASPECT_RATIO_Y'),
                child: CachedNetworkImage(
                  imageUrl: state.url!,
                  cacheKey: state.id?.toString(),
                  // fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                  placeholderFadeInDuration: const Duration(milliseconds: 500),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                          value: downloadProgress.progress),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          InkWell(
                  child: Icon(FontAwesomeIcons.timesCircle,
                      color: (ref.watch(imagesProvider).length > 2)
                          ? Theme.of(context).errorColor
                          : Colors.grey,
                      size: 26),
                  onTap: ref
                      .read(imageStateProvider(position).notifier)
                      .removeImage)
              .positioned(top: 5, right: 5),
        ],
      );
    }

    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            shape: bottomSheetShape(),
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BottomSheetHeader(text: Headings.pickImageBottomSheet),
                  TextButton(
                          onPressed: () {
                            ref
                                .read(imageStateProvider(position).notifier)
                                .pickImage(ImageSource.camera);
                            Navigator.pop(context);
                          },
                          child: const CustomTextWidget(
                              text: ButtonTitles.camera,
                              type: TextWidgetType.heading6,
                              withRow: false))
                      .padding(vertical: 8),
                  const CustomDivider(),
                  TextButton(
                      onPressed: () {
                        ref
                            .read(imageStateProvider(position).notifier)
                            .pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      child: const CustomTextWidget(
                        text: ButtonTitles.gallery,
                        type: TextWidgetType.heading6,
                        withRow: false,
                      )).padding(vertical: 8),
                ],
              );
            });
      },
      child: DottedBorder(
          color: Theme.of(context).primaryColor,
          strokeWidth: 1,
          borderType: BorderType.RRect,
          radius: const Radius.circular(8),
          child: Align(
            alignment: Alignment.center,
            child: Icon(FontAwesomeIcons.plus,
                color: Theme.of(context).primaryColor),
          )),
    );
  }
}
