import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/components/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

enum HeaderWith { cross, chevron, noButton }

class CustomHeaderTile extends HookConsumerWidget {
  final String text;
  final Color? color;
  final HeaderWith headerWith;
  final double bottomPadding;
  // final bool? withCross;
  // final bool? withChevron;
  const CustomHeaderTile(
      {Key? key,
      required this.text,
      this.color,
      required this.headerWith,
      this.bottomPadding = 10})
      : super(key: key);

  Widget _header(String text, Color? color, HeaderWith headerWith) {
    switch (headerWith) {
      case HeaderWith.chevron:
        return HeaderWithChevron(text: text, color: color);
      case HeaderWith.cross:
        return HeaderWithCross(text: text, color: color);
      case HeaderWith.noButton:
        return HeaderWithoutButton(text: text, color: color);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _header(text, color, headerWith),
        CustomDivider(color: color).padding(bottom: bottomPadding),
      ],
    );
  }
}

class HeaderWithoutButton extends HookConsumerWidget {
  final String text;
  final Color? color;

  const HeaderWithoutButton({Key? key, required this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GFListTile(
      padding: const EdgeInsets.symmetric(vertical: 4),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      title: Text(text,
          style: Theme.of(context).textTheme.headline5!.copyWith(color: color)),
    );
  }
}

class HeaderWithCross extends HookConsumerWidget {
  final String text;
  final Color? color;
  const HeaderWithCross({Key? key, required this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);

    return GFListTile(
      padding: const EdgeInsets.symmetric(vertical: 2),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      title: Text(text,
          style: Theme.of(context).textTheme.headline5!.copyWith(color: color)),
      icon: IconButton(
        icon: Icon(FontAwesomeIcons.solidTimesCircle,
            color: color ?? Theme.of(context).primaryColor, size: 20),
        onPressed: () {
          router.pop();
        },
      ),
    );
  }
}

class HeaderWithChevron extends HookConsumerWidget {
  final String text;
  final Color? color;
  const HeaderWithChevron({Key? key, required this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);

    return GFListTile(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.symmetric(vertical: 8),
      title: Row(
        children: [
          IconButton(
            icon: Icon(FontAwesomeIcons.chevronLeft,
                color: color ?? Theme.of(context).primaryColor, size: 20),
            onPressed: () {
              router.pop();
            },
          ),
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: color)),
        ],
      ),
    );
  }
}
