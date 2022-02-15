import 'package:baetobe/entities/data/readers.dart';
import 'package:baetobe/entities/data/user_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match.freezed.dart';
part 'match.g.dart';

@freezed
class Match with _$Match {
  const Match._();

  static dynamic _readUser(Map map, String key) => map['matched_user'][key];

  factory Match(
      {@JsonKey(name: '_id', readValue: Readers.readId)
          required int id,
      @JsonKey(name: 'name', readValue: Match._readUser)
          required String userName,
      @JsonKey(name: 'closed_by')
          int? closedBy,
      @JsonKey(name: 'is_closed')
          required bool isClosed,
      @JsonKey(name: 'id', readValue: Match._readUser)
          required int userId,
      @JsonKey(name: 'age', readValue: Match._readUser)
          required int age,
      @JsonKey(name: 'time_since_update')
          required String timeSinceUpdate,
      @Default(0)
      @JsonKey(name: 'unread_count')
          int unreadCount,
      @JsonKey(name: 'updated_at', readValue: Readers.parseInt)
          required int updatedAt,
      @JsonKey(name: 'profile_picture', readValue: Match._readUser)
          UserImage? profilePicture}) = _Match;

  bool hasUnread() {
    return unreadCount > 0;
  }

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
}
