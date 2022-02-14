import 'package:baetobe/entities/data/readers.dart';
import 'package:baetobe/entities/data/user_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.freezed.dart';
part 'like.g.dart';

enum likeDirection { sent, received }

@freezed
class Like with _$Like {
  static dynamic _readUser(Map map, String key) => map['user'][key];

  factory Like(
      {@JsonKey(name: '_id', readValue: Readers.readId)
          required int id,
      @JsonKey(name: 'name', readValue: Like._readUser)
          required String userName,
      @JsonKey(name: 'id', readValue: Like._readUser)
          required int userId,
      @JsonKey(name: 'summary', readValue: Like._readUser)
          required String summary,
      @JsonKey(name: 'age', readValue: Like._readUser)
          required int age,
      @JsonKey(name: 'time_since_creation')
          required String timeSinceCreation,
      @JsonKey(name: 'profile_picture', readValue: Like._readUser)
          UserImage? profilePicture}) = _Like;

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
}
