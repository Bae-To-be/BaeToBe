import 'package:baetobe/entities/data/user_image.dart';

enum likeDirection { sent, received }

class Like {
  int id;
  String userName;
  String summary;
  int userId;
  UserImage? profilePicture;
  String timeSinceCreation;

  Like(
      {required this.id,
      required this.userName,
      required this.userId,
      required this.summary,
      required this.timeSinceCreation,
      required this.profilePicture});

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
        userName: json['user']['name'],
        id: json['id'],
        userId: json['user']['id'],
        summary: json['user']['summary'],
        timeSinceCreation: json['time_since_creation'],
        profilePicture: json['user']['profile_picture'] != null
            ? UserImage.fromJson(json['user']['profile_picture'])
            : null);
  }
}
