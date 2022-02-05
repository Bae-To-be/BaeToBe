import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_user_state.freezed.dart';

@freezed
class ReportUserState with _$ReportUserState {
  factory ReportUserState({
    int? selected,
    String? comment,
  }) = _ReportUserState;
}
