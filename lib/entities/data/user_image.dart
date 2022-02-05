import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_image.freezed.dart';
part 'user_image.g.dart';

@freezed
class UserImage with _$UserImage {
  factory UserImage(
      {required String url,
      required int id,
      required int position}) = _UserImage;

  factory UserImage.fromJson(Map<String, dynamic> json) =>
      _$UserImageFromJson(json);
}
