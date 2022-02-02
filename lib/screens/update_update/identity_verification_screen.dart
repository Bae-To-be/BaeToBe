import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/identity/identity_document_tile.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/form_states/identity_verification_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class IdentityVerificationScreen extends HookConsumerWidget {
  final bool? redirectBack;

  const IdentityVerificationScreen(
      {Key? key, @QueryParam('redirectBack') this.redirectBack})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(identityVerificationStateProvider);
    return FormLayout(
        children: [
          const SizedBox(height: 32),
          const Heading5(text: Headings.identityVerification)
              .padding(top: 32, bottom: 10, left: 15),
          const Caption(
            text: InfoLabels.identityVerification,
            withRow: false,
          ).padding(horizontal: 15, bottom: 20),
          const SizedBox(
            height: 64,
            child: IdentityDocumentTile(),
          ),
          const Caption(
            text: InfoLabels.identityDocumentGuidelines,
            withRow: false,
          ).padding(horizontal: 15, vertical: 20),
          Expanded(child: Container()),
        ],
        floatingSubmit: FloatingCta(
          enabled: state.uploaded,
          onPressed: () {
            if (redirectBack == true) {
              ref.read(routerProvider.notifier).pop();
              return;
            }
            ref
                .read(routerProvider.notifier)
                .pushNamed(AppLinks.underVerification);
          },
        ));
  }
}
