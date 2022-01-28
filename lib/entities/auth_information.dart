import 'package:baetobe/application/datetime.dart';

class AuthInformation {
  String accessToken;
  String refreshToken;
  int expiresIn;
  DateTime fetchedAt;

  AuthInformation(
      this.accessToken, this.refreshToken, this.expiresIn, this.fetchedAt);

  bool shouldRefresh() {
    final duration =
        DateTime.now().difference(fetchedAt.add(Duration(seconds: expiresIn)));
    return !duration.isNegative || duration.inSeconds > -100;
  }

  AuthInformation.fromJson(Map<String, dynamic> json)
      : accessToken = json['access_token'],
        expiresIn = json['expires_in'],
        fetchedAt = dateFormat.parse(json['fetched_at']),
        refreshToken = json['refresh_token'];

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
        'expires_in': expiresIn,
        'fetched_at': dateFormat.format(fetchedAt)
      };
}
