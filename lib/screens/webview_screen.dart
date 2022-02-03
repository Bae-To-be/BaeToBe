import 'package:auto_route/annotations.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final pageLoading = useState(true);
    return Column(
      children: [
        CustomHeaderTile(
            text: pageLoading.value ? Headings.loadingArticle : ''),
        Expanded(
          child: WebView(
            backgroundColor: offWhite,
            initialUrl: decodeURI(url!),
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (_) => pageLoading.value = false,
          ),
        ),
      ],
    );
  }
}
