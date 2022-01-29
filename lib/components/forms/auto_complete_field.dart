import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AutoCompleteField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final String? errorText;
  final Future<List<String>> Function(String pattern) suggestionsCallback;
  final void Function(String selection) onSuggestionSelected;

  const AutoCompleteField(
      {Key? key,
      required this.textController,
      required this.hintText,
      required this.suggestionsCallback,
      required this.onSuggestionSelected,
      this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      direction: AxisDirection.up,
      autoFlipDirection: true,
      textFieldConfiguration: TextFieldConfiguration(
          controller: textController,
          decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              hintText: hintText,
              errorText: errorText),
          style: Theme.of(context).textTheme.subtitle1),
      suggestionsCallback: suggestionsCallback,
      suggestionsBoxDecoration: const SuggestionsBoxDecoration(
        color: Colors.white,
      ),
      hideOnLoading: true,
      hideOnEmpty: true,
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion as String),
        );
      },
      onSuggestionSelected: onSuggestionSelected,
    );
  }
}
