import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_information.freezed.dart';
part 'auth_information.g.dart';

@freezed
class AuthInformation with _$AuthInformation {
  const AuthInformation._();

  factory AuthInformation(
          {@JsonKey(defaultValue: 'access_token') required String accessToken,
          @JsonKey(defaultValue: 'refresh_token') required String refreshToken,
          @JsonKey(defaultValue: 'expires_in') required int expiresIn,
          @JsonKey(defaultValue: 'fetched_at') required DateTime fetchedAt}) =
      _AuthInformation;

  factory AuthInformation.fromJson(Map<String, dynamic> json) =>
      _$AuthInformationFromJson(json);

  bool shouldRefresh() {
    final duration =
        DateTime.now().difference(fetchedAt.add(Duration(seconds: expiresIn)));
    return !duration.isNegative || duration.inSeconds > -100;
  }
}
