import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/education/education_tile.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

final educationFormStateProvider =
    StateNotifierProvider.autoDispose<EducationFormState, List<UserEducation>>(
        (ref) {
  return EducationFormState(ref);
});

final _editingEducationProvider = StateProvider<int?>((ref) => 0);

extension ValidInfo on List<UserEducation> {
  bool allInformationValid() {
    return isNotEmpty && !any((education) => !education.allFieldsPresent());
  }
}

class EducationFormState extends StateNotifier<List<UserEducation>> {
  final Ref ref;
  EducationFormState(this.ref) : super([]) {
    final user = ref.watch(userProvider);
    user.whenData((userValue) {
      if (userValue.education.isEmpty) {
        addEducation();
      } else {
        state = userValue.education;
      }
    });
  }

  void addEducation() {
    state += [UserEducation('', '', '2010')];
  }

  void removeEducation(int index) {
    state = List.from(state)..removeAt(index);
  }

  void updateEducation({
    String? courseName,
    String? universityName,
    String? year,
    required int index,
  }) {
    final newEducation = state[index].copyWith(
      newCourseName: courseName,
      newUniversityName: universityName,
      newYear: year,
    );
    state = List.from(state)
      ..removeAt(index)
      ..insert(index, newEducation);
  }
}

class EducationHistoryScreen extends HookConsumerWidget {
  const EducationHistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final state = ref.watch(educationFormStateProvider);
    final editing = ref.watch(_editingEducationProvider);

    return FormLayout(
      children: [
        const SizedBox(height: 32),
        const Heading5(text: Headings.educationBackground)
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
                  if (ref.read(_editingEducationProvider.notifier).state ==
                      index) {
                    ref.read(_editingEducationProvider.notifier).state = null;
                  } else {
                    ref.read(_editingEducationProvider.notifier).state = index;
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
        color: state.allInformationValid()
            ? Theme.of(context).primaryColor
            : Colors.grey,
        loading: user is AsyncLoading,
        onPressed: () {
          if (state.allInformationValid()) {
            return;
          }

          ref.read(userProvider.notifier).updateAttributes({
            'education': state.map((education) => education.toJson()).toList()
          }, routeTo: AppLinks.updateLinkedInURL);
        },
      ),
    );
  }
}
