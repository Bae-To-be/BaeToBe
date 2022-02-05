import 'package:freezed_annotation/freezed_annotation.dart';

part 'gender.freezed.dart';
part 'gender.g.dart';

@freezed
class Gender with _$Gender {
  factory Gender({required String name, required int id}) = _Gender;

  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);
}
