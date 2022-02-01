import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/form_states/identity_verification_state_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class IdentityDocumentTile extends HookConsumerWidget {
  const IdentityDocumentTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(identityVerificationStateProvider);
    if (state.uploading) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: GFShimmer(
            mainColor: Theme.of(context).primaryColor,
            secondaryColor: Theme.of(context).primaryColorLight,
            child: Container(
              color: Theme.of(context).primaryColorLight,
            ),
          ));
    }

    if (state.uploaded) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColorLight,
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 1.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(FontAwesomeIcons.solidCheckCircle,
                            size: 20, color: Theme.of(context).primaryColor)
                        .padding(horizontal: 24),
                    Text(InfoLabels.fileAdded,
                        style: TextStyle(color: Theme.of(context).primaryColor))
                  ],
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.timesCircle,
                          size: 20, color: Theme.of(context).primaryColor)
                      .padding(right: 24),
                  onPressed: ref
                      .read(identityVerificationStateProvider.notifier)
                      .clearFile,
                ),
              ],
            ).alignment(Alignment.center),
          ));
    }
    return DottedBorder(
        borderType: BorderType.RRect,
        color: Theme.of(context).primaryColor,
        strokeWidth: 1.5,
        dashPattern: const <double>[20, 5],
        radius: const Radius.circular(8),
        child: GestureDetector(
          onTap: ref.read(identityVerificationStateProvider.notifier).pickFile,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).primaryColorLight,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.upload,
                        size: 16, color: Theme.of(context).primaryColor)
                    .padding(right: 8),
                Text(InfoLabels.addAFile,
                    style: TextStyle(color: Theme.of(context).primaryColor))
              ],
            ).alignment(Alignment.center),
          ),
        ));
  }
}
