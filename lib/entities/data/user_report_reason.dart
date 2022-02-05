import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_report_reason.freezed.dart';
part 'user_report_reason.g.dart';

@freezed
class UserReportReason with _$UserReportReason {
  factory UserReportReason({required String name, required int id}) =
      _UserReportReason;

  factory UserReportReason.fromJson(Map<String, dynamic> json) =>
      _$UserReportReasonFromJson(json);
}
