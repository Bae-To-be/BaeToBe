import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/forms/custom_checkbox.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

final urlFormat = RegExp('https:\\/\\/[a-z]{2,3}\\.linkedin\\.com\\/.*');

extension LinkedinUrl on String? {
  bool isValidLinkedinUrl() {
    return urlFormat.hasMatch(this ?? '');
  }
}

final _urlStateProvider = StateProvider.autoDispose<String?>((ref) {
  final user = ref.watch(userProvider);
  return user.value?.linkedInURL;
});

final _isPublicStateProvider = StateProvider.autoDispose<bool>((ref) {
  final user = ref.watch(userProvider);
  return user.value?.linkedInPublic ?? false;
});

class LinkedinUrlScreen extends HookConsumerWidget {
  const LinkedinUrlScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlState = ref.watch(_urlStateProvider);
    final isPublicState = ref.watch(_isPublicStateProvider);
    final urlController = useTextEditingController
        .fromValue(TextEditingValue(text: urlState ?? ''));
    urlController.addListener(() {
      if (ref.read(_urlStateProvider.notifier).state != urlController.text) {
        ref.read(_urlStateProvider.notifier).state = urlController.text;
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
        const Heading5(text: Headings.enterLinkedIn)
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
            ref.read(_isPublicStateProvider.notifier).state = value;
          },
        ),
      ],
      floatingSubmit: FloatingCta(
        color: urlState.isValidLinkedinUrl()
            ? Theme.of(context).primaryColor
            : Colors.grey,
        onPressed: () {
          if (!urlState.isValidLinkedinUrl()) {
            return;
          }
          ref.read(userProvider.notifier).updateAttributes({
            'linkedin_url': urlState,
            'linkedin_public': isPublicState,
          }, routeTo: AppLinks.updateImages);
        },
      ),
    );
  }
}
