import 'package:auto_route/annotations.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpArticleScreen extends HookConsumerWidget {
  final String id;
  final apiHostURL =
      FirebaseRemoteConfig.instance.getString(RemoteConfigs.apiHostURL);

  HelpArticleScreen({Key? key, @pathParam required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageLoading = useState(true);
    return Column(
      children: [
        CustomHeaderTile(
          text: pageLoading.value ? Headings.loadingArticle : '',
          headerWith: HeaderWith.cross,
        ),
        Expanded(
          child: WebView(
            backgroundColor: offWhite,
            initialUrl: '$apiHostURL/articles/$id',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (_) => pageLoading.value = false,
          ),
        ),
      ],
    );
  }
}
