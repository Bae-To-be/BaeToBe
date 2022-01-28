import 'package:baetobe/application/page_wrapper.dart';
import 'package:baetobe/components/custom_icons.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/auth_provider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Future<void> launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  List<Widget> loginButtons(BuildContext context, AuthNotifier auth) {
    if (auth.isLoading()) {
      return [
        CircularProgressIndicator(color: Theme.of(context).primaryColor)
            .padding(bottom: 20)
      ];
    }
    return [
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: GFButton(
          onPressed: auth.loginWithFacebook,
          shape: GFButtonShape.pills,
          color: const Color(0xFF1877F2),
          size: GFSize.LARGE,
          blockButton: true,
          buttonBoxShadow: true,
          child: Stack(
            children: const <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(FontAwesomeIcons.facebook, color: Colors.white)),
              Align(
                alignment: Alignment.center,
                child: Text(ButtonTexts.continueWithFb),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: GFButton(
          onPressed: auth.loginWithGoogle,
          color: Colors.red,
          shape: GFButtonShape.pills,
          size: GFSize.LARGE,
          blockButton: true,
          child: Stack(
            children: const <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(FontAwesomeIcons.google, color: Colors.white)),
              Align(
                alignment: Alignment.center,
                child: Text(ButtonTexts.continueWithGoogle),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider.notifier);

    return PageWrapper(
      child: Padding(
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
                  WidgetSpan(
                    child: Icon(CustomIcons.btbheart,
                        size: 12, color: Color(0xFFEC505C)),
                  ),
                ],
              ),
            ),
            Expanded(flex: 3, child: Container()),
            Column(
              children: [
                ...loginButtons(context, auth),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: RichText(
                    text: const TextSpan(
                      text: 'We don’t post anything on your ',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Social accounts.',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'By continuing you agree to our ',
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms and Conditions ',
                          style: const TextStyle(
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchURL(
                                  '${RemoteConfig.instance.getString('API_HOST')}${RemoteConfig.instance.getString('TERMS_AND_CONDITIONS')}');
                            },
                        ),
                        const TextSpan(text: 'and '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: const TextStyle(
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchURL(
                                  '${RemoteConfig.instance.getString('API_HOST')}${RemoteConfig.instance.getString('PRIVACY_POLICY')}');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
