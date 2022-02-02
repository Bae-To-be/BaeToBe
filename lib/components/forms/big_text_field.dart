import 'package:flutter/material.dart';

class BigFomField extends StatelessWidget {
  final String value;
  final void Function(String) onChanged;
  const BigFomField({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      minLines: 3,
      style: const TextStyle(fontSize: 14),
      maxLines: 20,
      maxLength: 500,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColorLight, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColorLight, width: 1),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
