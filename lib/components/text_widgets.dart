import 'package:baetobe/domain/search_query_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class Heading5 extends StatelessWidget {
  final String text;

  const Heading5({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ],
    );
  }
}

class Heading6 extends StatelessWidget {
  final String text;

  const Heading6({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ],
    );
  }
}

class Caption extends StatelessWidget {
  final String text;

  const Caption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.caption,
        ),
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
