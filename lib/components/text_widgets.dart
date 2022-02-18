import 'package:baetobe/domain/search_query_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

enum TextWidgetType {
  heading1,
  heading2,
  heading3,
  heading4,
  heading5,
  heading6,
  caption,
  subtitle1,
  subtitle2,
  editProfileContentTileTitle,
  editProfileContentTileContent,
  editProfileSectionTile
}

class CustomTextWidget extends StatelessWidget {
  final TextWidgetType type;
  final String text;
  final bool withRow;
  final bool withFlexible;
  final Color? color;

  const CustomTextWidget(
      {Key? key,
      required this.type,
      required this.text,
      this.color,
      this.withRow = true,
      this.withFlexible = false})
      : super(key: key);

  TextStyle textStyleForWidget(BuildContext context) {
    switch (type) {
      case TextWidgetType.heading1:
        return Theme.of(context).textTheme.headline1!.copyWith(color: color);
      case TextWidgetType.heading2:
        return Theme.of(context).textTheme.headline2!.copyWith(color: color);
      case TextWidgetType.heading3:
        return Theme.of(context).textTheme.headline3!.copyWith(color: color);
      case TextWidgetType.heading4:
        return Theme.of(context).textTheme.headline4!.copyWith(color: color);
      case TextWidgetType.heading5:
        return Theme.of(context).textTheme.headline5!.copyWith(color: color);
      case TextWidgetType.heading6:
        return Theme.of(context).textTheme.headline6!.copyWith(color: color);
      case TextWidgetType.caption:
        return Theme.of(context).textTheme.caption!.copyWith(color: color);
      case TextWidgetType.subtitle1:
        return Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.w600, color: color);
      case TextWidgetType.subtitle2:
        return Theme.of(context).textTheme.subtitle2!.copyWith(color: color);
      case TextWidgetType.editProfileContentTileTitle:
        return const TextStyle(fontSize: 17, fontWeight: FontWeight.w600);
      case TextWidgetType.editProfileContentTileContent:
        return const TextStyle(color: Colors.grey, fontSize: 16);
      case TextWidgetType.editProfileSectionTile:
        return const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 22, color: Colors.grey);
      default:
        return Theme.of(context).textTheme.bodyText1!.copyWith(color: color);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GenericTextWidget(
        text: text,
        withRow: withRow,
        withFlexible: withFlexible,
        textStyle: textStyleForWidget(context));
  }
}

class GenericTextWidget extends StatelessWidget {
  final String text;
  final bool withRow;
  final bool withFlexible;
  final TextStyle textStyle;
  const GenericTextWidget(
      {Key? key,
      required this.text,
      this.withRow = true,
      this.withFlexible = false,
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
    Widget result = body(context);
    if (withFlexible) {
      result = Flexible(
        child: result,
      );
    }

    if (withRow) {
      result = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          result,
        ],
      );
    }

    return result;
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
