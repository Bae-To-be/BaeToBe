import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_verification_file.freezed.dart';
part 'user_verification_file.g.dart';

@freezed
class UserVerificationFile with _$UserVerificationFile {
  factory UserVerificationFile(
          {required String url,
          @JsonKey(name: 'file_type') required String fileType}) =
      _UserVerificationFile;

  factory UserVerificationFile.fromJson(Map<String, dynamic> json) =>
      _$UserVerificationFileFromJson(json);
}
