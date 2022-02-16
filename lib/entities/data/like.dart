import 'package:baetobe/entities/data/basic_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.freezed.dart';
part 'like.g.dart';

enum likeDirection { sent, received }

@freezed
class Like with _$Like {
  factory Like({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'user') required BasicProfile user,
    @JsonKey(name: 'time_since_creation') required String timeSinceCreation,
  }) = _Like;

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
}
