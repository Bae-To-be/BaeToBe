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
  final bool withCross;
  const CustomHeaderTile(
      {Key? key, required this.text, this.color, this.withCross = true})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);

    return Column(
      children: [
        if (withCross) Container() else const SizedBox(height: 2),
        GFListTile(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            title: Text(text,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: color)),
            icon: withCross
                ? IconButton(
                    icon: Icon(FontAwesomeIcons.solidTimesCircle,
                        color: color ?? Theme.of(context).primaryColor,
                        size: 20),
                    onPressed: () {
                      router.pop();
                    },
                  )
                : null),
        if (withCross) Container() else const SizedBox(height: 2),
        CustomDivider(color: color).padding(bottom: 10),
      ],
    );
  }
}
