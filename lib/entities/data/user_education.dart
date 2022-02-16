import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_education.freezed.dart';
part 'user_education.g.dart';

@freezed
class UserEducation with _$UserEducation {
  UserEducation._();

  factory UserEducation(
          {@JsonKey(name: 'course') required String courseName,
          @JsonKey(name: 'year') required int year,
          @JsonKey(name: 'university') required String universityName}) =
      _UserEducation;

  factory UserEducation.fromJson(Map<String, dynamic> json) =>
      _$UserEducationFromJson(json);

  bool allFieldsPresent() {
    return courseName != '' && universityName != '' && year != 0;
  }

  String formatted() {
    return '$courseName from $universityName in $year';
  }

  Map<String, dynamic> submitPayload() {
    return {
      'course_name': courseName,
      'university_name': universityName,
      'year': year
    };
  }
}
