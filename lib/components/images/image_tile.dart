import 'package:baetobe/domain/form_states/images_state_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:styled_widget/styled_widget.dart';

class ImageTile extends StatelessWidget {
  final ImageFormState state;
  final void Function() onAddPressed;
  final void Function() onRemovePressed;

  const ImageTile(
      {Key? key,
      required this.state,
      required this.onAddPressed,
      required this.onRemovePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.uploading) {
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
                  onTap: onRemovePressed)
              .positioned(top: 5, right: 5),
        ],
      );
    }

    return InkWell(
      onTap: onAddPressed,
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
