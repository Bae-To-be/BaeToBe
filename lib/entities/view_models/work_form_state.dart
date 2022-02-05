import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_form_state.freezed.dart';

@freezed
class WorkFormState with _$WorkFormState {
  const WorkFormState._();

  factory WorkFormState({
    int? industryId,
    String? workTitleName,
    String? companyName,
  }) = _WorkFormState;

  bool allFilled() {
    return industryId != null &&
        companyName?.isNotEmpty == true &&
        workTitleName?.isNotEmpty == true;
  }
}
