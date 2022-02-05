import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/components/buttons/custom_text_button.dart';
import 'package:baetobe/components/custom_divider.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/auth_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountSettingsScreen extends HookConsumerWidget {
  const AccountSettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeaderTile(text: Headings.settings),
        const CustomTextWidget(
                type: textWidgetType.heading6, text: Headings.profile)
            .padding(left: 20, bottom: 10),
        const CustomDivider().padding(horizontal: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomTextWidget(
                text: InfoLabels.pauseAccount, type: textWidgetType.subtitle1),
            GFToggle(
              enabledTrackColor: Theme.of(context).primaryColor,
              onChanged: (val) {
                final toUpdate =
                    val == true ? UserStatus.paused : UserStatus.active;
                ref
                    .read(userProvider.notifier)
                    .updateAttributes({'status': toUpdate});
              },
              type: GFToggleType.ios,
              value: user.status == UserStatus.paused,
            )
          ],
        ).padding(left: 20, right: 5, vertical: 10),
        const CustomTextWidget(
                type: textWidgetType.heading6, text: Headings.legal)
            .padding(left: 20, bottom: 10),
        const CustomDivider().padding(horizontal: 20),
        GFListTile(
          padding: const EdgeInsets.only(top: 10),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          title: Text('Terms and Conditions',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold)),
          icon: Icon(
            FontAwesomeIcons.chevronRight,
            color: Theme.of(context).primaryColor,
          ),
          onTap: () => launchURL(
              '${FirebaseRemoteConfig.instance.getString('API_HOST')}${FirebaseRemoteConfig.instance.getString('TERMS_AND_CONDITIONS')}'),
        ),
        GFListTile(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          title: Text('Privacy Policy',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold)),
          icon: Icon(
            FontAwesomeIcons.chevronRight,
            color: Theme.of(context).primaryColor,
          ),
          onTap: () => launchURL(
              '${FirebaseRemoteConfig.instance.getString('API_HOST')}${FirebaseRemoteConfig.instance.getString('PRIVACY_POLICY')}'),
        ),
        const CustomTextWidget(
                type: textWidgetType.heading6, text: Headings.notifications)
            .padding(left: 20, bottom: 10),
        const CustomDivider().padding(horizontal: 20),
        Expanded(child: Container()),
        const CustomDivider().padding(horizontal: 20, top: 15, bottom: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextButton(
              text: LinkTexts.logout,
              onPressed: ref.read(authProvider.notifier).logout,
              type: textWidgetType.caption,
            ),
          ],
        ),
        const CustomDivider().padding(horizontal: 20, vertical: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextButton(
              color: Colors.red[300],
              text: LinkTexts.deleteAccount,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(InfoLabels.warning),
                      content: const Text(InfoLabels.permanentAction),
                      actions: [
                        TextButton(
                          child: const Text(LinkTexts.cancel),
                          onPressed: () {
                            ref.read(routerProvider.notifier).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(LinkTexts.cont),
                          onPressed:
                              ref.read(authProvider.notifier).deleteAccount,
                        ),
                      ],
                    );
                  },
                );
              },
              type: textWidgetType.caption,
            ),
          ],
        ),
      ],
    );
  }
}

Future<void> launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
