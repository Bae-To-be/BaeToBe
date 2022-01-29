import 'package:baetobe/components/forms/auto_complete_field.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/suggestions.dart';
import 'package:baetobe/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

List<String> yearList = [];

List<String> yearOptions() {
  if (yearList.isNotEmpty) {
    return yearList;
  }

  final tenYearsAhead = DateTime.now().add(const Duration(days: 3650)).year;
  final fiftyYearsAgo =
      DateTime.now().subtract(const Duration(days: 18250)).year;
  for (int yearOption = tenYearsAhead;
      yearOption >= fiftyYearsAgo;
      yearOption--) {
    yearList.add(yearOption.toString());
  }
  return yearList;
}

class EducationTile extends HookConsumerWidget {
  final UserEducation education;
  final bool isEditing;
  final void Function() onEditToggle;
  final void Function() onRemove;
  final void Function(
      {String? courseName, String? universityName, String? year}) onEdit;

  const EducationTile({
    Key? key,
    required this.education,
    required this.isEditing,
    required this.onEdit,
    required this.onEditToggle,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final universityController = useTextEditingController
        .fromValue(TextEditingValue(text: education.universityName));
    final courseController = useTextEditingController
        .fromValue(TextEditingValue(text: education.courseName));
    universityController.addListener(() {
      onEdit(universityName: universityController.text);
    });
    courseController.addListener(() {
      onEdit(courseName: courseController.text);
    });
    useEffect(() {
      if (education.universityName != '' &&
          universityController.text != education.universityName) {
        universityController.text = education.universityName;
      }
      if (education.courseName != '' &&
          courseController.text != education.courseName) {
        courseController.text = education.courseName;
      }
      return null;
    }, [education]);

    if (isEditing) {
      return Column(
        children: [
          const Heading6(text: Headings.schoolName)
              .padding(left: 15, bottom: 10),
          AutoCompleteField(
            textController: universityController,
            onSuggestionSelected: (value) {
              universityController.text = value;
            },
            suggestionsCallback: (pattern) {
              return suggestionsFor(SuggestionEntity.university, pattern, ref);
            },
            hintText: Placeholders.university,
          ).padding(horizontal: 15, bottom: 10),
          const Heading6(text: Headings.courseName)
              .padding(left: 15, vertical: 10),
          AutoCompleteField(
            textController: courseController,
            onSuggestionSelected: (value) {
              courseController.text = value;
            },
            suggestionsCallback: (pattern) {
              return suggestionsFor(SuggestionEntity.course, pattern, ref);
            },
            hintText: Placeholders.university,
          ).padding(horizontal: 15, bottom: 10),
          const Heading6(text: Headings.year).padding(left: 15, vertical: 10),
          GFDropdown(
            padding: const EdgeInsets.only(right: 15, left: 15, bottom: 5),
            dropdownButtonColor: const Color(0xFFF2F2F2),
            iconEnabledColor: Theme.of(context).primaryColor,
            iconDisabledColor: Theme.of(context).primaryColor,
            isExpanded: true,
            value: education.year != '' ? education.year : null,
            onChanged: (newValue) {
              onEdit(year: newValue as String);
            },
            hint: Text(
              Headings.year,
              style: Theme.of(context).textTheme.caption,
            ),
            items: yearOptions()
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
          ),
          TextButton(
              onPressed: onEditToggle,
              child: Text(LinkTexts.doneEditing,
                  style: TextStyle(color: Theme.of(context).primaryColor))),
          TextButton(
              onPressed: onRemove,
              child: Text(LinkTexts.removeRow,
                  style: TextStyle(color: Theme.of(context).errorColor))),
        ],
      );
    }

    return ListTile(
      title: Text('${education.courseName} at '
          '${education.universityName} in '
          '${education.year}'),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
          color: Colors.red,
          icon: const Icon(FontAwesomeIcons.trash, size: 18),
          onPressed: onRemove,
        ),
        IconButton(
          color: Theme.of(context).primaryColor,
          icon: const Icon(FontAwesomeIcons.pen, size: 18),
          onPressed: onEditToggle,
        )
      ]),
    );
  }
}
