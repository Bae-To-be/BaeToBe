import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/components/verification/selfie_container.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/form_states/selfie_verification_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class SelfieVerificationScreen extends HookConsumerWidget {
  const SelfieVerificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selfieStateProvider);

    return FormLayout(
      children: [
        const SizedBox(height: 32),
        const Heading5(text: Headings.selfieVerification)
            .padding(top: 32, bottom: 10, left: 15),
        const Caption(
          text: InfoLabels.selfieVerification,
          withRow: false,
        ).padding(horizontal: 15, bottom: 20),
        SelfieContainer(
          state: state,
        ),
      ],
      leftFloating: state.url != null
          ? FloatingCta(
              heroTag: 'delete',
              color: Colors.red,
              onPressed: ref.read(selfieStateProvider.notifier).clearPicture,
              icon: FontAwesomeIcons.trashAlt)
          : null,
      floatingSubmit: FloatingCta(
        icon: state.url == null ? FontAwesomeIcons.camera : null,
        enabled: true,
        onPressed: () {
          if (state.url == null) {
            ref.read(selfieStateProvider.notifier).clickPicture();
            return;
          }
          ref
              .read(routerProvider.notifier)
              .pushNamed(AppLinks.identityVerification);
        },
      ),
    );
  }
}
