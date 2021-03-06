import 'package:freezed_annotation/freezed_annotation.dart';

part 'preference.freezed.dart';
part 'preference.g.dart';

@freezed
class Preference with _$Preference {
  factory Preference({required String name, required int id}) = _Preference;

  factory Preference.fromJson(Map<String, dynamic> json) =>
      _$PreferenceFromJson(json);
}
