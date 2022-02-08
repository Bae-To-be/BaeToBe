// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'detailed_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailedProfile _$DetailedProfileFromJson(Map<String, dynamic> json) {
  return _DetailedProfile.fromJson(json);
}

/// @nodoc
class _$DetailedProfileTearOff {
  const _$DetailedProfileTearOff();

  _DetailedProfile call(
      {required int id,
      required String name,
      required String gender,
      required int age,
      required String company,
      required String industry,
      @JsonKey(name: 'linkedin_url') required String? linkedinUrl,
      required String? bio,
      required UserHometown hometown,
      Religion? religion,
      Preference? smoking,
      Preference? food,
      Preference? drinking,
      Preference? children,
      Preference? exercise,
      @JsonKey(name: 'height_in_cms') required int? heightInCms,
      @JsonKey(name: 'status') required String matchStatus,
      required Match? match,
      @JsonKey(name: 'is_reported') required bool isReported,
      required List<Language> languages,
      required List<UserEducation> education,
      @JsonKey(name: 'work_title') required String workTitle,
      required List<UserImage> images}) {
    return _DetailedProfile(
      id: id,
      name: name,
      gender: gender,
      age: age,
      company: company,
      industry: industry,
      linkedinUrl: linkedinUrl,
      bio: bio,
      hometown: hometown,
      religion: religion,
      smoking: smoking,
      food: food,
      drinking: drinking,
      children: children,
      exercise: exercise,
      heightInCms: heightInCms,
      matchStatus: matchStatus,
      match: match,
      isReported: isReported,
      languages: languages,
      education: education,
      workTitle: workTitle,
      images: images,
    );
  }

  DetailedProfile fromJson(Map<String, Object?> json) {
    return DetailedProfile.fromJson(json);
  }
}

/// @nodoc
const $DetailedProfile = _$DetailedProfileTearOff();

/// @nodoc
mixin _$DetailedProfile {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  String get industry => throw _privateConstructorUsedError;
  @JsonKey(name: 'linkedin_url')
  String? get linkedinUrl => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  UserHometown get hometown => throw _privateConstructorUsedError;
  Religion? get religion => throw _privateConstructorUsedError;
  Preference? get smoking => throw _privateConstructorUsedError;
  Preference? get food => throw _privateConstructorUsedError;
  Preference? get drinking => throw _privateConstructorUsedError;
  Preference? get children => throw _privateConstructorUsedError;
  Preference? get exercise => throw _privateConstructorUsedError;
  @JsonKey(name: 'height_in_cms')
  int? get heightInCms => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get matchStatus => throw _privateConstructorUsedError;
  Match? get match => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_reported')
  bool get isReported => throw _privateConstructorUsedError;
  List<Language> get languages => throw _privateConstructorUsedError;
  List<UserEducation> get education => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_title')
  String get workTitle => throw _privateConstructorUsedError;
  List<UserImage> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailedProfileCopyWith<DetailedProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedProfileCopyWith<$Res> {
  factory $DetailedProfileCopyWith(
          DetailedProfile value, $Res Function(DetailedProfile) then) =
      _$DetailedProfileCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String gender,
      int age,
      String company,
      String industry,
      @JsonKey(name: 'linkedin_url') String? linkedinUrl,
      String? bio,
      UserHometown hometown,
      Religion? religion,
      Preference? smoking,
      Preference? food,
      Preference? drinking,
      Preference? children,
      Preference? exercise,
      @JsonKey(name: 'height_in_cms') int? heightInCms,
      @JsonKey(name: 'status') String matchStatus,
      Match? match,
      @JsonKey(name: 'is_reported') bool isReported,
      List<Language> languages,
      List<UserEducation> education,
      @JsonKey(name: 'work_title') String workTitle,
      List<UserImage> images});

  $UserHometownCopyWith<$Res> get hometown;
  $ReligionCopyWith<$Res>? get religion;
  $PreferenceCopyWith<$Res>? get smoking;
  $PreferenceCopyWith<$Res>? get food;
  $PreferenceCopyWith<$Res>? get drinking;
  $PreferenceCopyWith<$Res>? get children;
  $PreferenceCopyWith<$Res>? get exercise;
  $MatchCopyWith<$Res>? get match;
}

/// @nodoc
class _$DetailedProfileCopyWithImpl<$Res>
    implements $DetailedProfileCopyWith<$Res> {
  _$DetailedProfileCopyWithImpl(this._value, this._then);

  final DetailedProfile _value;
  // ignore: unused_field
  final $Res Function(DetailedProfile) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? age = freezed,
    Object? company = freezed,
    Object? industry = freezed,
    Object? linkedinUrl = freezed,
    Object? bio = freezed,
    Object? hometown = freezed,
    Object? religion = freezed,
    Object? smoking = freezed,
    Object? food = freezed,
    Object? drinking = freezed,
    Object? children = freezed,
    Object? exercise = freezed,
    Object? heightInCms = freezed,
    Object? matchStatus = freezed,
    Object? match = freezed,
    Object? isReported = freezed,
    Object? languages = freezed,
    Object? education = freezed,
    Object? workTitle = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      industry: industry == freezed
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String,
      linkedinUrl: linkedinUrl == freezed
          ? _value.linkedinUrl
          : linkedinUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      hometown: hometown == freezed
          ? _value.hometown
          : hometown // ignore: cast_nullable_to_non_nullable
              as UserHometown,
      religion: religion == freezed
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as Religion?,
      smoking: smoking == freezed
          ? _value.smoking
          : smoking // ignore: cast_nullable_to_non_nullable
              as Preference?,
      food: food == freezed
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Preference?,
      drinking: drinking == freezed
          ? _value.drinking
          : drinking // ignore: cast_nullable_to_non_nullable
              as Preference?,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as Preference?,
      exercise: exercise == freezed
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as Preference?,
      heightInCms: heightInCms == freezed
          ? _value.heightInCms
          : heightInCms // ignore: cast_nullable_to_non_nullable
              as int?,
      matchStatus: matchStatus == freezed
          ? _value.matchStatus
          : matchStatus // ignore: cast_nullable_to_non_nullable
              as String,
      match: match == freezed
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as Match?,
      isReported: isReported == freezed
          ? _value.isReported
          : isReported // ignore: cast_nullable_to_non_nullable
              as bool,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      education: education == freezed
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as List<UserEducation>,
      workTitle: workTitle == freezed
          ? _value.workTitle
          : workTitle // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<UserImage>,
    ));
  }

  @override
  $UserHometownCopyWith<$Res> get hometown {
    return $UserHometownCopyWith<$Res>(_value.hometown, (value) {
      return _then(_value.copyWith(hometown: value));
    });
  }

  @override
  $ReligionCopyWith<$Res>? get religion {
    if (_value.religion == null) {
      return null;
    }

    return $ReligionCopyWith<$Res>(_value.religion!, (value) {
      return _then(_value.copyWith(religion: value));
    });
  }

  @override
  $PreferenceCopyWith<$Res>? get smoking {
    if (_value.smoking == null) {
      return null;
    }

    return $PreferenceCopyWith<$Res>(_value.smoking!, (value) {
      return _then(_value.copyWith(smoking: value));
    });
  }

  @override
  $PreferenceCopyWith<$Res>? get food {
    if (_value.food == null) {
      return null;
    }

    return $PreferenceCopyWith<$Res>(_value.food!, (value) {
      return _then(_value.copyWith(food: value));
    });
  }

  @override
  $PreferenceCopyWith<$Res>? get drinking {
    if (_value.drinking == null) {
      return null;
    }

    return $PreferenceCopyWith<$Res>(_value.drinking!, (value) {
      return _then(_value.copyWith(drinking: value));
    });
  }

  @override
  $PreferenceCopyWith<$Res>? get children {
    if (_value.children == null) {
      return null;
    }

    return $PreferenceCopyWith<$Res>(_value.children!, (value) {
      return _then(_value.copyWith(children: value));
    });
  }

  @override
  $PreferenceCopyWith<$Res>? get exercise {
    if (_value.exercise == null) {
      return null;
    }

    return $PreferenceCopyWith<$Res>(_value.exercise!, (value) {
      return _then(_value.copyWith(exercise: value));
    });
  }

  @override
  $MatchCopyWith<$Res>? get match {
    if (_value.match == null) {
      return null;
    }

    return $MatchCopyWith<$Res>(_value.match!, (value) {
      return _then(_value.copyWith(match: value));
    });
  }
}

/// @nodoc
abstract class _$DetailedProfileCopyWith<$Res>
    implements $DetailedProfileCopyWith<$Res> {
  factory _$DetailedProfileCopyWith(
          _DetailedProfile value, $Res Function(_DetailedProfile) then) =
      __$DetailedProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String gender,
      int age,
      String company,
      String industry,
      @JsonKey(name: 'linkedin_url') String? linkedinUrl,
      String? bio,
      UserHometown hometown,
      Religion? religion,
      Preference? smoking,
      Preference? food,
      Preference? drinking,
      Preference? children,
      Preference? exercise,
      @JsonKey(name: 'height_in_cms') int? heightInCms,
      @JsonKey(name: 'status') String matchStatus,
      Match? match,
      @JsonKey(name: 'is_reported') bool isReported,
      List<Language> languages,
      List<UserEducation> education,
      @JsonKey(name: 'work_title') String workTitle,
      List<UserImage> images});

  @override
  $UserHometownCopyWith<$Res> get hometown;
  @override
  $ReligionCopyWith<$Res>? get religion;
  @override
  $PreferenceCopyWith<$Res>? get smoking;
  @override
  $PreferenceCopyWith<$Res>? get food;
  @override
  $PreferenceCopyWith<$Res>? get drinking;
  @override
  $PreferenceCopyWith<$Res>? get children;
  @override
  $PreferenceCopyWith<$Res>? get exercise;
  @override
  $MatchCopyWith<$Res>? get match;
}

/// @nodoc
class __$DetailedProfileCopyWithImpl<$Res>
    extends _$DetailedProfileCopyWithImpl<$Res>
    implements _$DetailedProfileCopyWith<$Res> {
  __$DetailedProfileCopyWithImpl(
      _DetailedProfile _value, $Res Function(_DetailedProfile) _then)
      : super(_value, (v) => _then(v as _DetailedProfile));

  @override
  _DetailedProfile get _value => super._value as _DetailedProfile;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? age = freezed,
    Object? company = freezed,
    Object? industry = freezed,
    Object? linkedinUrl = freezed,
    Object? bio = freezed,
    Object? hometown = freezed,
    Object? religion = freezed,
    Object? smoking = freezed,
    Object? food = freezed,
    Object? drinking = freezed,
    Object? children = freezed,
    Object? exercise = freezed,
    Object? heightInCms = freezed,
    Object? matchStatus = freezed,
    Object? match = freezed,
    Object? isReported = freezed,
    Object? languages = freezed,
    Object? education = freezed,
    Object? workTitle = freezed,
    Object? images = freezed,
  }) {
    return _then(_DetailedProfile(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      industry: industry == freezed
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String,
      linkedinUrl: linkedinUrl == freezed
          ? _value.linkedinUrl
          : linkedinUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      hometown: hometown == freezed
          ? _value.hometown
          : hometown // ignore: cast_nullable_to_non_nullable
              as UserHometown,
      religion: religion == freezed
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as Religion?,
      smoking: smoking == freezed
          ? _value.smoking
          : smoking // ignore: cast_nullable_to_non_nullable
              as Preference?,
      food: food == freezed
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Preference?,
      drinking: drinking == freezed
          ? _value.drinking
          : drinking // ignore: cast_nullable_to_non_nullable
              as Preference?,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as Preference?,
      exercise: exercise == freezed
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as Preference?,
      heightInCms: heightInCms == freezed
          ? _value.heightInCms
          : heightInCms // ignore: cast_nullable_to_non_nullable
              as int?,
      matchStatus: matchStatus == freezed
          ? _value.matchStatus
          : matchStatus // ignore: cast_nullable_to_non_nullable
              as String,
      match: match == freezed
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as Match?,
      isReported: isReported == freezed
          ? _value.isReported
          : isReported // ignore: cast_nullable_to_non_nullable
              as bool,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      education: education == freezed
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as List<UserEducation>,
      workTitle: workTitle == freezed
          ? _value.workTitle
          : workTitle // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<UserImage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetailedProfile implements _DetailedProfile {
  _$_DetailedProfile(
      {required this.id,
      required this.name,
      required this.gender,
      required this.age,
      required this.company,
      required this.industry,
      @JsonKey(name: 'linkedin_url') required this.linkedinUrl,
      required this.bio,
      required this.hometown,
      this.religion,
      this.smoking,
      this.food,
      this.drinking,
      this.children,
      this.exercise,
      @JsonKey(name: 'height_in_cms') required this.heightInCms,
      @JsonKey(name: 'status') required this.matchStatus,
      required this.match,
      @JsonKey(name: 'is_reported') required this.isReported,
      required this.languages,
      required this.education,
      @JsonKey(name: 'work_title') required this.workTitle,
      required this.images});

  factory _$_DetailedProfile.fromJson(Map<String, dynamic> json) =>
      _$$_DetailedProfileFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String gender;
  @override
  final int age;
  @override
  final String company;
  @override
  final String industry;
  @override
  @JsonKey(name: 'linkedin_url')
  final String? linkedinUrl;
  @override
  final String? bio;
  @override
  final UserHometown hometown;
  @override
  final Religion? religion;
  @override
  final Preference? smoking;
  @override
  final Preference? food;
  @override
  final Preference? drinking;
  @override
  final Preference? children;
  @override
  final Preference? exercise;
  @override
  @JsonKey(name: 'height_in_cms')
  final int? heightInCms;
  @override
  @JsonKey(name: 'status')
  final String matchStatus;
  @override
  final Match? match;
  @override
  @JsonKey(name: 'is_reported')
  final bool isReported;
  @override
  final List<Language> languages;
  @override
  final List<UserEducation> education;
  @override
  @JsonKey(name: 'work_title')
  final String workTitle;
  @override
  final List<UserImage> images;

  @override
  String toString() {
    return 'DetailedProfile(id: $id, name: $name, gender: $gender, age: $age, company: $company, industry: $industry, linkedinUrl: $linkedinUrl, bio: $bio, hometown: $hometown, religion: $religion, smoking: $smoking, food: $food, drinking: $drinking, children: $children, exercise: $exercise, heightInCms: $heightInCms, matchStatus: $matchStatus, match: $match, isReported: $isReported, languages: $languages, education: $education, workTitle: $workTitle, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DetailedProfile &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.company, company) &&
            const DeepCollectionEquality().equals(other.industry, industry) &&
            const DeepCollectionEquality()
                .equals(other.linkedinUrl, linkedinUrl) &&
            const DeepCollectionEquality().equals(other.bio, bio) &&
            const DeepCollectionEquality().equals(other.hometown, hometown) &&
            const DeepCollectionEquality().equals(other.religion, religion) &&
            const DeepCollectionEquality().equals(other.smoking, smoking) &&
            const DeepCollectionEquality().equals(other.food, food) &&
            const DeepCollectionEquality().equals(other.drinking, drinking) &&
            const DeepCollectionEquality().equals(other.children, children) &&
            const DeepCollectionEquality().equals(other.exercise, exercise) &&
            const DeepCollectionEquality()
                .equals(other.heightInCms, heightInCms) &&
            const DeepCollectionEquality()
                .equals(other.matchStatus, matchStatus) &&
            const DeepCollectionEquality().equals(other.match, match) &&
            const DeepCollectionEquality()
                .equals(other.isReported, isReported) &&
            const DeepCollectionEquality().equals(other.languages, languages) &&
            const DeepCollectionEquality().equals(other.education, education) &&
            const DeepCollectionEquality().equals(other.workTitle, workTitle) &&
            const DeepCollectionEquality().equals(other.images, images));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(gender),
        const DeepCollectionEquality().hash(age),
        const DeepCollectionEquality().hash(company),
        const DeepCollectionEquality().hash(industry),
        const DeepCollectionEquality().hash(linkedinUrl),
        const DeepCollectionEquality().hash(bio),
        const DeepCollectionEquality().hash(hometown),
        const DeepCollectionEquality().hash(religion),
        const DeepCollectionEquality().hash(smoking),
        const DeepCollectionEquality().hash(food),
        const DeepCollectionEquality().hash(drinking),
        const DeepCollectionEquality().hash(children),
        const DeepCollectionEquality().hash(exercise),
        const DeepCollectionEquality().hash(heightInCms),
        const DeepCollectionEquality().hash(matchStatus),
        const DeepCollectionEquality().hash(match),
        const DeepCollectionEquality().hash(isReported),
        const DeepCollectionEquality().hash(languages),
        const DeepCollectionEquality().hash(education),
        const DeepCollectionEquality().hash(workTitle),
        const DeepCollectionEquality().hash(images)
      ]);

  @JsonKey(ignore: true)
  @override
  _$DetailedProfileCopyWith<_DetailedProfile> get copyWith =>
      __$DetailedProfileCopyWithImpl<_DetailedProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailedProfileToJson(this);
  }
}

abstract class _DetailedProfile implements DetailedProfile {
  factory _DetailedProfile(
      {required int id,
      required String name,
      required String gender,
      required int age,
      required String company,
      required String industry,
      @JsonKey(name: 'linkedin_url') required String? linkedinUrl,
      required String? bio,
      required UserHometown hometown,
      Religion? religion,
      Preference? smoking,
      Preference? food,
      Preference? drinking,
      Preference? children,
      Preference? exercise,
      @JsonKey(name: 'height_in_cms') required int? heightInCms,
      @JsonKey(name: 'status') required String matchStatus,
      required Match? match,
      @JsonKey(name: 'is_reported') required bool isReported,
      required List<Language> languages,
      required List<UserEducation> education,
      @JsonKey(name: 'work_title') required String workTitle,
      required List<UserImage> images}) = _$_DetailedProfile;

  factory _DetailedProfile.fromJson(Map<String, dynamic> json) =
      _$_DetailedProfile.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get gender;
  @override
  int get age;
  @override
  String get company;
  @override
  String get industry;
  @override
  @JsonKey(name: 'linkedin_url')
  String? get linkedinUrl;
  @override
  String? get bio;
  @override
  UserHometown get hometown;
  @override
  Religion? get religion;
  @override
  Preference? get smoking;
  @override
  Preference? get food;
  @override
  Preference? get drinking;
  @override
  Preference? get children;
  @override
  Preference? get exercise;
  @override
  @JsonKey(name: 'height_in_cms')
  int? get heightInCms;
  @override
  @JsonKey(name: 'status')
  String get matchStatus;
  @override
  Match? get match;
  @override
  @JsonKey(name: 'is_reported')
  bool get isReported;
  @override
  List<Language> get languages;
  @override
  List<UserEducation> get education;
  @override
  @JsonKey(name: 'work_title')
  String get workTitle;
  @override
  List<UserImage> get images;
  @override
  @JsonKey(ignore: true)
  _$DetailedProfileCopyWith<_DetailedProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
