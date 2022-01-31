import 'package:baetobe/domain/form_states/image_state_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                        value: downloadProgress.progress),
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
      onTap: ref.read(imageStateProvider(position).notifier).pickImage,
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
