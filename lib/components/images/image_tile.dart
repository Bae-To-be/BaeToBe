import 'package:baetobe/components/bottomsheet_utils.dart';
import 'package:baetobe/components/custom_divider.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/domain/form_states/image_state_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';
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
      return CircularProgressIndicator(color: Theme.of(context).primaryColor)
          .padding(all: 24);
    }

    if (state.url != null) {
      return Stack(
        children: <Widget>[
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: state.url!,
                cacheKey: state.id?.toString(),
                placeholderFadeInDuration: const Duration(milliseconds: 500),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    GFShimmer(
                        child: Container(
                  color: Colors.white,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          InkWell(
                  child: Icon(FontAwesomeIcons.timesCircle,
                      color: Theme.of(context).errorColor, size: 26),
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
                  const BottomSheetHeader(text: 'Pick your photos'),
                  TextButton(
                          onPressed: () {
                            ref
                                .read(imageStateProvider(position).notifier)
                                .pickImage(ImageSource.camera);
                            Navigator.pop(context);
                          },
                          child: const CustomTextWidget(
                              text: 'Camera',
                              type: textWidgetType.heading5,
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
                        text: 'Gallery',
                        type: textWidgetType.heading5,
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
