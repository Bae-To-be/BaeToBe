import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final educationFormStateProvider =
    StateNotifierProvider.autoDispose<EducationFormState, List<UserEducation>>(
        (ref) {
  return EducationFormState(ref);
});

final editingEducationProvider = StateProvider.autoDispose<int?>((ref) => 0);

extension ValidInfo on List<UserEducation> {
  bool allInformationValid() {
    return isNotEmpty && !any((education) => !education.allFieldsPresent());
  }
}

class EducationFormState extends StateNotifier<List<UserEducation>> {
  final Ref ref;
  EducationFormState(this.ref) : super([]) {
    final user = ref.watch(userProvider);
    if (user.education.isEmpty) {
      addEducation();
    } else {
      state = user.education;
    }
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
