import 'package:baetobe/components/buttons/rounded_cta.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/auth_provider.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Future<void> launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  List<Widget> loginButtons(BuildContext context, AuthNotifier auth) {
    return [
      RoundedCta(
              onPressed: auth.loginWithFacebook,
              text: LinkTexts.continueWithFb,
              color: const Color(0xFF1877F2),
              icon: FontAwesomeIcons.facebook)
          .padding(bottom: 16),
      RoundedCta(
              onPressed: auth.loginWithGoogle,
              text: LinkTexts.continueWithGoogle,
              color: Colors.red,
              icon: FontAwesomeIcons.google)
          .padding(bottom: 16),
    ];
  }

  List<Widget> loader(BuildContext context) {
    return [
      CircularProgressIndicator(color: Theme.of(context).primaryColor)
          .padding(bottom: 20)
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final loading = ref.watch(loadingProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 91,
              ),
            ],
          ),
          Expanded(flex: 1, child: Container()),
          RichText(
            textAlign: TextAlign.left,
            text: const TextSpan(
              style: TextStyle(fontSize: 32, color: Color(0xFF00838C)),
              children: [
                TextSpan(text: Headings.sellingPoint),
                TextSpan(
                    text: ' \u{e800}',
                    style: TextStyle(
                        fontFamily: 'BTBCustomIcons',
                        fontSize: 10,
                        color: Color(0xFFEC505C))),
              ],
            ),
          ),
          Expanded(flex: 3, child: Container()),
          Column(
            children: [
              ...auth.maybeWhen(
                  loading: () => loader(context),
                  orElse: () => loading
                      ? loader(context)
                      : loginButtons(context, ref.read(authProvider.notifier))),
              RichText(
                text: const TextSpan(
                  text: InfoLabels.weDontPostAnything,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: InfoLabels.socialAccounts,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ).padding(bottom: 8),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: InfoLabels.byContinuingYouAgree,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: LinkTexts.termsAndConditions,
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchURL(
                              '${FirebaseRemoteConfig.instance.getString('API_HOST')}${FirebaseRemoteConfig.instance.getString('TERMS_AND_CONDITIONS')}');
                        },
                    ),
                    const TextSpan(text: 'and '),
                    TextSpan(
                      text: '${LinkTexts.privacyPolicy}.',
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchURL(
                              '${FirebaseRemoteConfig.instance.getString('API_HOST')}${FirebaseRemoteConfig.instance.getString('PRIVACY_POLICY')}');
                        },
                    ),
                  ],
                ),
              ).padding(bottom: 40),
            ],
          ),
        ],
      ),
    );
  }
}
