import 'package:baetobe/entities/data/user_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_profile.freezed.dart';
part 'basic_profile.g.dart';

@freezed
class BasicProfile with _$BasicProfile {
  factory BasicProfile(
      {required String name,
      required int age,
      required UserImage profilePicture}) = _BasicProfile;

  factory BasicProfile.fromJson(Map<String, dynamic> json) =>
      _$BasicProfileFromJson(json);
}
