import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/components/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class CustomHeaderTile extends HookConsumerWidget {
  final String text;
  final Color? color;
  const CustomHeaderTile({Key? key, required this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);

    return Column(
      children: [
        GFListTile(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            title: Text(text,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: color)),
            icon: IconButton(
              icon: Icon(FontAwesomeIcons.solidTimesCircle,
                  color: color ?? Theme.of(context).primaryColor, size: 20),
              onPressed: () {
                router.pop();
              },
            )),
        CustomDivider(color: color).padding(bottom: 15),
      ],
    );
  }
}
