import 'package:auto_route/auto_route.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/forms/custom_checkbox.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/form_states/linkedin_info_state_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class LinkedinUrlScreen extends HookConsumerWidget {
  final bool? redirectBack;
  const LinkedinUrlScreen(
      {Key? key, @QueryParam('redirectBack') this.redirectBack})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlState = ref.watch(linkedinUrlStateProvider);
    final isPublicState = ref.watch(linkedinPublicStateProvider);
    final urlController = useTextEditingController
        .fromValue(TextEditingValue(text: urlState ?? ''));
    urlController.addListener(() {
      if (ref.read(linkedinUrlStateProvider.notifier).state !=
          urlController.text) {
        ref.read(linkedinUrlStateProvider.notifier).state = urlController.text;
      }
    });
    useEffect(() {
      if (urlState != null && urlController.text != urlState) {
        urlController.text = urlState;
      }
      return null;
    }, [urlState]);
    return FormLayout(
      children: [
        const SizedBox(height: 32),
        const CustomTextWidget(
                type: textWidgetType.heading5, text: Headings.enterLinkedIn)
            .padding(top: 32, bottom: 20, left: 15),
        TextField(
                controller: urlController,
                autocorrect: false,
                decoration: InputDecoration(
                    errorText: urlState.isValidLinkedinUrl()
                        ? null
                        : ErrorMessages.invalidLinkedinUrl,
                    border: const UnderlineInputBorder(),
                    labelText: Placeholders.linkedInURL),
                style: Theme.of(context).textTheme.subtitle1)
            .padding(horizontal: 15),
        CustomCheckbox(
          selected: isPublicState,
          subtitleText: InfoLabels.linkedinPublic,
          onChanged: (bool value) {
            ref.read(linkedinPublicStateProvider.notifier).state = value;
          },
        ),
      ],
      floatingSubmit: FloatingCta(
        icon: redirectBack == true
            ? FontAwesomeIcons.solidSave
            : FontAwesomeIcons.chevronRight,
        enabled: urlState.isValidLinkedinUrl(),
        onPressed: () {
          ref.read(userProvider.notifier).updateAttributes({
            'linkedin_url': urlState,
            'linkedin_public': isPublicState,
          },
              routeTo:
                  redirectBack == true ? AppLinks.back : AppLinks.updateImages);
        },
      ),
    );
  }
}
