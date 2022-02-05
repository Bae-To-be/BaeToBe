import 'package:freezed_annotation/freezed_annotation.dart';

part 'religion.freezed.dart';
part 'religion.g.dart';

@freezed
class Religion with _$Religion {
  factory Religion({required String name, required int id}) = _Religion;

  factory Religion.fromJson(Map<String, dynamic> json) =>
      _$ReligionFromJson(json);
}
