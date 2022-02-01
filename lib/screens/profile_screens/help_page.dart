// import 'package:baetobe/application/routes.dart';
// import 'package:baetobe/application/strings.dart';
// import 'package:baetobe/domain/articles_controller.dart';
// import 'package:baetobe/domain/loading_controller.dart';
// import 'package:baetobe/infrastructure/remote_config.dart';
// import 'package:baetobe/presentation/components/custom_divider.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:styled_widget/styled_widget.dart';

class HelpPage extends HookConsumerWidget {
  // final _articleController = Get.find<ArticlesController>();
  // final _config = Get.find<RemoteConfigWrapper>();
  // final _loading = Get.find<LoadingController>();

  const HelpPage({Key? key}) : super(key: key);

  // Widget body(BuildContext context) {
  //   if (_loading.loading.value) {
  //     return Column(
  //       children: [
  //         SizedBox(height: Get.height * 0.4),
  //         const Text(
  //           Strings.loadingArticles,
  //         ).padding(bottom: 10),
  //         Center(
  //             child: CircularProgressIndicator(
  //                 color: Theme.of(context).primaryColor))
  //       ],
  //     );
  //   }
  //   return ListView.builder(
  //       itemCount: _articleController.articles.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return TextButton(
  //           onPressed: () {
  //             Get.toNamed(AppLinks.webview,
  //                 arguments:
  //                 '${_config.getString('API_HOST')}/articles/${_articleController.articles[index].value.id}');
  //           },
  //           child: ListTile(
  //               trailing: const Icon(FontAwesomeIcons.chevronRight),
  //               title: Wrap(children: [
  //                 Text(_articleController.articles[index].value.title,
  //                     style: Theme.of(context).textTheme.subtitle1),
  //               ])),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text('Help Page'),
    );
    //   return Column(
    //     children: [
    //       GFListTile(
    //           padding: const EdgeInsets.all(0),
    //           margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    //           title: Text('FAQs', style: Theme.of(context).textTheme.headline5),
    //           icon: IconButton(
    //             icon: Icon(FontAwesomeIcons.solidTimesCircle,
    //                 color: Theme.of(context).primaryColor, size: 20),
    //             onPressed: () => Get.back(),
    //           )),
    //       const CustomDivider(),
    //       Expanded(
    //         child: body(context),
    //       ),
    //     ],
    //   );
  }
}
