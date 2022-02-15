import 'package:baetobe/entities/data/basic_profile.dart';
import 'package:baetobe/entities/data/readers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match.freezed.dart';
part 'match.g.dart';

@freezed
class Match with _$Match {
  const Match._();

  factory Match(
      {@JsonKey(name: '_id', readValue: Readers.readId)
          required int id,
      @JsonKey(name: 'matched_user')
          required BasicProfile basicProfile,
      @JsonKey(name: 'closed_by')
          int? closedBy,
      @JsonKey(name: 'is_closed')
          required bool isClosed,
      @JsonKey(name: 'time_since_update')
          required String timeSinceUpdate,
      @Default(0)
      @JsonKey(name: 'unread_count')
          int unreadCount,
      @JsonKey(name: 'updated_at', readValue: Readers.parseInt)
          required int updatedAt}) = _Match;

  bool hasUnread() {
    return unreadCount > 0;
  }

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
}
