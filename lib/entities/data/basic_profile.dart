import 'package:baetobe/entities/data/user_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_profile.freezed.dart';
part 'basic_profile.g.dart';

@freezed
class BasicProfile with _$BasicProfile {
  factory BasicProfile(
          {@JsonKey(name: 'name') required String userName,
          required int age,
          @JsonKey(name: 'id') required int userId,
          @Default('') @JsonKey(name: 'summary') String? summary,
          @JsonKey(name: 'profile_picture') UserImage? profilePicture}) =
      _BasicProfile;

  factory BasicProfile.fromJson(Map<String, dynamic> json) =>
      _$BasicProfileFromJson(json);
}
