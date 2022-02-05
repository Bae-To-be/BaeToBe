// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_verification_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserVerificationFile _$UserVerificationFileFromJson(Map<String, dynamic> json) {
  return _UserVerificationFile.fromJson(json);
}

/// @nodoc
class _$UserVerificationFileTearOff {
  const _$UserVerificationFileTearOff();

  _UserVerificationFile call(
      {required String url,
      @JsonKey(name: 'file_type') required String fileType}) {
    return _UserVerificationFile(
      url: url,
      fileType: fileType,
    );
  }

  UserVerificationFile fromJson(Map<String, Object?> json) {
    return UserVerificationFile.fromJson(json);
  }
}

/// @nodoc
const $UserVerificationFile = _$UserVerificationFileTearOff();

/// @nodoc
mixin _$UserVerificationFile {
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_type')
  String get fileType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserVerificationFileCopyWith<UserVerificationFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserVerificationFileCopyWith<$Res> {
  factory $UserVerificationFileCopyWith(UserVerificationFile value,
          $Res Function(UserVerificationFile) then) =
      _$UserVerificationFileCopyWithImpl<$Res>;
  $Res call({String url, @JsonKey(name: 'file_type') String fileType});
}

/// @nodoc
class _$UserVerificationFileCopyWithImpl<$Res>
    implements $UserVerificationFileCopyWith<$Res> {
  _$UserVerificationFileCopyWithImpl(this._value, this._then);

  final UserVerificationFile _value;
  // ignore: unused_field
  final $Res Function(UserVerificationFile) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? fileType = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: fileType == freezed
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserVerificationFileCopyWith<$Res>
    implements $UserVerificationFileCopyWith<$Res> {
  factory _$UserVerificationFileCopyWith(_UserVerificationFile value,
          $Res Function(_UserVerificationFile) then) =
      __$UserVerificationFileCopyWithImpl<$Res>;
  @override
  $Res call({String url, @JsonKey(name: 'file_type') String fileType});
}

/// @nodoc
class __$UserVerificationFileCopyWithImpl<$Res>
    extends _$UserVerificationFileCopyWithImpl<$Res>
    implements _$UserVerificationFileCopyWith<$Res> {
  __$UserVerificationFileCopyWithImpl(
      _UserVerificationFile _value, $Res Function(_UserVerificationFile) _then)
      : super(_value, (v) => _then(v as _UserVerificationFile));

  @override
  _UserVerificationFile get _value => super._value as _UserVerificationFile;

  @override
  $Res call({
    Object? url = freezed,
    Object? fileType = freezed,
  }) {
    return _then(_UserVerificationFile(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: fileType == freezed
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserVerificationFile implements _UserVerificationFile {
  _$_UserVerificationFile(
      {required this.url, @JsonKey(name: 'file_type') required this.fileType});

  factory _$_UserVerificationFile.fromJson(Map<String, dynamic> json) =>
      _$$_UserVerificationFileFromJson(json);

  @override
  final String url;
  @override
  @JsonKey(name: 'file_type')
  final String fileType;

  @override
  String toString() {
    return 'UserVerificationFile(url: $url, fileType: $fileType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserVerificationFile &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.fileType, fileType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(fileType));

  @JsonKey(ignore: true)
  @override
  _$UserVerificationFileCopyWith<_UserVerificationFile> get copyWith =>
      __$UserVerificationFileCopyWithImpl<_UserVerificationFile>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserVerificationFileToJson(this);
  }
}

abstract class _UserVerificationFile implements UserVerificationFile {
  factory _UserVerificationFile(
          {required String url,
          @JsonKey(name: 'file_type') required String fileType}) =
      _$_UserVerificationFile;

  factory _UserVerificationFile.fromJson(Map<String, dynamic> json) =
      _$_UserVerificationFile.fromJson;

  @override
  String get url;
  @override
  @JsonKey(name: 'file_type')
  String get fileType;
  @override
  @JsonKey(ignore: true)
  _$UserVerificationFileCopyWith<_UserVerificationFile> get copyWith =>
      throw _privateConstructorUsedError;
}
