import 'package:baetobe/domain/search_query_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class Heading4 extends StatelessWidget {
  final String text;
  final bool withRow;
  const Heading4({Key? key, required this.text, this.withRow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericTextWidget(
        text: text,
        withRow: withRow,
        textStyle: Theme.of(context).textTheme.headline2!);
  }
}

class Heading5 extends StatelessWidget {
  final String text;
  final bool withRow;
  const Heading5({Key? key, required this.text, this.withRow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericTextWidget(
        text: text,
        withRow: withRow,
        textStyle: Theme.of(context).textTheme.headline5!);
  }
}

class Heading6 extends StatelessWidget {
  final String text;
  final bool withRow;
  const Heading6({Key? key, required this.text, this.withRow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericTextWidget(
        text: text,
        withRow: withRow,
        textStyle: Theme.of(context).textTheme.headline6!);
  }
}

class Subtitle1 extends StatelessWidget {
  final String text;
  final bool withRow;
  const Subtitle1({Key? key, required this.text, this.withRow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericTextWidget(
        text: text,
        withRow: withRow,
        textStyle: Theme.of(context).textTheme.subtitle1!);
  }
}

class Caption extends StatelessWidget {
  final String text;
  final bool withRow;
  const Caption({Key? key, required this.text, this.withRow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericTextWidget(
        text: text,
        withRow: withRow,
        textStyle: Theme.of(context).textTheme.caption!);
  }
}

class GenericTextWidget extends StatelessWidget {
  final String text;
  final bool withRow;
  final TextStyle textStyle;
  const GenericTextWidget(
      {Key? key,
      required this.text,
      this.withRow = true,
      required this.textStyle})
      : super(key: key);

  Widget body(context) {
    return Text(
      text,
      style: textStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!withRow) {
      return body(context);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        body(context),
      ],
    );
  }
}

class SearchField extends HookConsumerWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: GFColors.DARK),
            onChanged: (String value) =>
                ref.read(searchQueryProvider.notifier).state = value,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                prefixIcon: Icon(FontAwesomeIcons.search,
                    size: 15, color: Theme.of(context).primaryColor),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 32.0)),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFF2F2F2), width: 32.0))))
        .padding(all: 10);
  }
}
