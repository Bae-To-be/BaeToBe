// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserImage _$UserImageFromJson(Map<String, dynamic> json) {
  return _UserImage.fromJson(json);
}

/// @nodoc
class _$UserImageTearOff {
  const _$UserImageTearOff();

  _UserImage call(
      {required String url, required int id, required int position}) {
    return _UserImage(
      url: url,
      id: id,
      position: position,
    );
  }

  UserImage fromJson(Map<String, Object?> json) {
    return UserImage.fromJson(json);
  }
}

/// @nodoc
const $UserImage = _$UserImageTearOff();

/// @nodoc
mixin _$UserImage {
  String get url => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserImageCopyWith<UserImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserImageCopyWith<$Res> {
  factory $UserImageCopyWith(UserImage value, $Res Function(UserImage) then) =
      _$UserImageCopyWithImpl<$Res>;
  $Res call({String url, int id, int position});
}

/// @nodoc
class _$UserImageCopyWithImpl<$Res> implements $UserImageCopyWith<$Res> {
  _$UserImageCopyWithImpl(this._value, this._then);

  final UserImage _value;
  // ignore: unused_field
  final $Res Function(UserImage) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? id = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UserImageCopyWith<$Res> implements $UserImageCopyWith<$Res> {
  factory _$UserImageCopyWith(
          _UserImage value, $Res Function(_UserImage) then) =
      __$UserImageCopyWithImpl<$Res>;
  @override
  $Res call({String url, int id, int position});
}

/// @nodoc
class __$UserImageCopyWithImpl<$Res> extends _$UserImageCopyWithImpl<$Res>
    implements _$UserImageCopyWith<$Res> {
  __$UserImageCopyWithImpl(_UserImage _value, $Res Function(_UserImage) _then)
      : super(_value, (v) => _then(v as _UserImage));

  @override
  _UserImage get _value => super._value as _UserImage;

  @override
  $Res call({
    Object? url = freezed,
    Object? id = freezed,
    Object? position = freezed,
  }) {
    return _then(_UserImage(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserImage implements _UserImage {
  _$_UserImage({required this.url, required this.id, required this.position});

  factory _$_UserImage.fromJson(Map<String, dynamic> json) =>
      _$$_UserImageFromJson(json);

  @override
  final String url;
  @override
  final int id;
  @override
  final int position;

  @override
  String toString() {
    return 'UserImage(url: $url, id: $id, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserImage &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.position, position));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(position));

  @JsonKey(ignore: true)
  @override
  _$UserImageCopyWith<_UserImage> get copyWith =>
      __$UserImageCopyWithImpl<_UserImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserImageToJson(this);
  }
}

abstract class _UserImage implements UserImage {
  factory _UserImage(
      {required String url,
      required int id,
      required int position}) = _$_UserImage;

  factory _UserImage.fromJson(Map<String, dynamic> json) =
      _$_UserImage.fromJson;

  @override
  String get url;
  @override
  int get id;
  @override
  int get position;
  @override
  @JsonKey(ignore: true)
  _$UserImageCopyWith<_UserImage> get copyWith =>
      throw _privateConstructorUsedError;
}
