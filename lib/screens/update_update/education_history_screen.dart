import 'package:auto_route/auto_route.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/education/education_tile.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/form_states/education_history_state_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class EducationHistoryScreen extends HookConsumerWidget {
  final bool? redirectBack;

  const EducationHistoryScreen(
      {Key? key, @QueryParam('redirectBack') this.redirectBack})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(educationFormStateProvider);
    final editing = ref.watch(editingEducationProvider);

    return FormLayout(
      children: [
        const SizedBox(height: 32),
        const CustomTextWidget(
                type: textWidgetType.heading5,
                text: Headings.educationBackground)
            .padding(top: 32, bottom: 20, left: 15),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: state.length + 1,
            itemBuilder: (context, index) {
              if (index == state.length) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(FontAwesomeIcons.plus,
                        color: Theme.of(context).primaryColor, size: 15),
                    TextButton(
                        onPressed: ref
                            .read(educationFormStateProvider.notifier)
                            .addEducation,
                        child: Text(LinkTexts.addSchool,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor))),
                  ],
                ).padding(left: 15);
              }

              return EducationTile(
                education: state[index],
                isEditing: editing == index,
                onEditToggle: () {
                  if (ref.read(editingEducationProvider.notifier).state ==
                      index) {
                    ref.read(editingEducationProvider.notifier).state = null;
                  } else {
                    ref.read(editingEducationProvider.notifier).state = index;
                  }
                },
                onRemove: () => ref
                    .read(educationFormStateProvider.notifier)
                    .removeEducation(index),
                onEdit: (
                    {String? courseName,
                    String? universityName,
                    String? year}) {
                  ref.read(educationFormStateProvider.notifier).updateEducation(
                      courseName: courseName,
                      universityName: universityName,
                      year: year,
                      index: index);
                },
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        )
      ],
      floatingSubmit: FloatingCta(
        enabled: state.allInformationValid(),
        onPressed: () {
          ref.read(userProvider.notifier).updateAttributes({
            'education': state.map((education) => education.toJson()).toList()
          },
              routeTo: redirectBack == true
                  ? AppLinks.back
                  : AppLinks.updateLinkedInURL);
        },
      ),
    );
  }
}
