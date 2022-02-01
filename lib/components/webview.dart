import 'package:auto_route/annotations.dart';
import 'package:baetobe/application/routing/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends HookConsumerWidget {
  final String? url;

  const Webview({Key? key, @queryParam this.url}) : super(key: key);

  static String decodeURI(String uri) {
    return Uri.decodeFull(uri);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    return Column(
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                router.navigateBack();
              },
              child: Icon(
                FontAwesomeIcons.chevronLeft,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
        Expanded(
          child: WebView(
            initialUrl: decodeURI(url!),
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ],
    );
  }
}
