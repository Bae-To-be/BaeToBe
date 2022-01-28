import 'package:baetobe/entities/user.dart';

enum likeDirection { sent, received }

class Like {
  int id;
  String userName;
  int userId;
  UserImage? profilePicture;
  String timeSinceCreation;

  Like(
      {required this.id,
      required this.userName,
      required this.userId,
      required this.timeSinceCreation,
      required this.profilePicture});

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
        userName: json['user']['name'],
        id: json['id'],
        userId: json['user']['id'],
        timeSinceCreation: json['time_since_creation'],
        profilePicture: json['user']['profile_picture'] != null
            ? UserImage.fromJson(json['user']['profile_picture'])
            : null);
  }
}
