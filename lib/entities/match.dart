import 'dart:ui';

import 'package:baetobe/entities/user.dart';

class Match {
  int id;
  String userName;
  int userId;
  UserImage? profilePicture;
  String timeSinceUpdate;
  int updatedAt;
  int unreadCount;
  bool isClosed;
  int? closedBy;

  Match(
      {required this.id,
      required this.userName,
      required this.userId,
      required this.updatedAt,
      required this.unreadCount,
      required this.timeSinceUpdate,
      required this.isClosed,
      required this.closedBy,
      required this.profilePicture});

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
        userName: json['matched_user']['name'],
        id: json['id'],
        closedBy: json['closed_by'],
        isClosed: json['is_closed'],
        userId: json['matched_user']['id'],
        timeSinceUpdate: json['time_since_update'],
        unreadCount: json['unread_count'] ?? 0,
        updatedAt: int.parse(json['updated_at']),
        profilePicture: json['matched_user']['profile_picture'] != null
            ? UserImage.fromJson(json['matched_user']['profile_picture'])
            : null);
  }

  bool hasUnread() {
    return unreadCount > 0;
  }

  @override
  bool operator ==(other) {
    return other is Match &&
        (other.id == id) &&
        (other.unreadCount == unreadCount) &&
        (other.updatedAt == updatedAt);
  }

  @override
  int get hashCode => hashValues(
      id.hashCode,
      userName.hashCode,
      userId.hashCode,
      timeSinceUpdate.hashCode,
      updatedAt.hashCode,
      closedBy.hashCode,
      isClosed.hashCode);
}
