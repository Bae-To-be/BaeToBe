// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required int id,
      required String name,
      String? course,
      String? industry,
      String? company,
      String? university,
      @JsonKey(name: 'work_title')
          String? workTitle,
      String? birthday,
      String? gender,
      @JsonKey(name: 'linkedin_url')
          String? linkedInURL,
      int? age,
      @JsonKey(name: 'linkedin_public')
          bool? linkedInPublic,
      String? bio,
      @JsonKey(name: 'search_radius')
          int? searchRadius,
      @JsonKey(name: 'interested_age_lower')
          int? interestedAgeLower,
      @JsonKey(name: 'interested_age_upper')
          int? interestedAgeUpper,
      Religion? religion,
      @JsonKey(name: 'smoking_preference')
          Preference? smoking,
      @JsonKey(name: 'food_preference')
          Preference? food,
      @JsonKey(name: 'drinking_preference')
          Preference? drinking,
      @JsonKey(name: 'children_preference')
          Preference? children,
      @JsonKey(name: 'exercise_preference')
          Preference? exercise,
      @JsonKey(name: 'height_in_cms')
          int? height,
      String? status,
      required List<Language> languages,
      @JsonKey(name: 'interested_genders')
          required List<String> interestedGenders,
      required List<UserEducation> education,
      required UserHometown hometown}) {
    return _User(
      id: id,
      name: name,
      course: course,
      industry: industry,
      company: company,
      university: university,
      workTitle: workTitle,
      birthday: birthday,
      gender: gender,
      linkedInURL: linkedInURL,
      age: age,
      linkedInPublic: linkedInPublic,
      bio: bio,
      searchRadius: searchRadius,
      interestedAgeLower: interestedAgeLower,
      interestedAgeUpper: interestedAgeUpper,
      religion: religion,
      smoking: smoking,
      food: food,
      drinking: drinking,
      children: children,
      exercise: exercise,
      height: height,
      status: status,
      languages: languages,
      interestedGenders: interestedGenders,
      education: education,
      hometown: hometown,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get course => throw _privateConstructorUsedError;
  String? get industry => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get university => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_title')
  String? get workTitle => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'linkedin_url')
  String? get linkedInURL => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'linkedin_public')
  bool? get linkedInPublic => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'search_radius')
  int? get searchRadius => throw _privateConstructorUsedError;
  @JsonKey(name: 'interested_age_lower')
  int? get interestedAgeLower => throw _privateConstructorUsedError;
  @JsonKey(name: 'interested_age_upper')
  int? get interestedAgeUpper => throw _privateConstructorUsedError;
  Religion? get religion => throw _privateConstructorUsedError;
  @JsonKey(name: 'smoking_preference')
  Preference? get smoking => throw _privateConstructorUsedError;
  @JsonKey(name: 'food_preference')
  Preference? get food => throw _privateConstructorUsedError;
  @JsonKey(name: 'drinking_preference')
  Preference? get drinking => throw _privateConstructorUsedError;
  @JsonKey(name: 'children_preference')
  Preference? get children => throw _privateConstructorUsedError;
  @JsonKey(name: 'exercise_preference')
  Preference? get exercise => throw _privateConstructorUsedError;
  @JsonKey(name: 'height_in_cms')
  int? get height => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  List<Language> get languages => throw _privateConstructorUsedError;
  @JsonKey(name: 'interested_genders')
  List<String> get interestedGenders => throw _privateConstructorUsedError;
  List<UserEducation> get education => throw _privateConstructorUsedError;
  UserHometown get hometown => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String? course,
      String? industry,
      String? company,
      String? university,
      @JsonKey(name: 'work_title') String? workTitle,
      String? birthday,
      String? gender,
      @JsonKey(name: 'linkedin_url') String? linkedInURL,
      int? age,
      @JsonKey(name: 'linkedin_public') bool? linkedInPublic,
      String? bio,
      @JsonKey(name: 'search_radius') int? searchRadius,
      @JsonKey(name: 'interested_age_lower') int? interestedAgeLower,
      @JsonKey(name: 'interested_age_upper') int? interestedAgeUpper,
      Religion? religion,
      @JsonKey(name: 'smoking_preference') Preference? smoking,
      @JsonKey(name: 'food_preference') Preference? food,
      @JsonKey(name: 'drinking_preference') Preference? drinking,
      @JsonKey(name: 'children_preference') Preference? children,
      @JsonKey(name: 'exercise_preference') Preference? exercise,
      @JsonKey(name: 'height_in_cms') int? height,
      String? status,
      List<Language> languages,
      @JsonKey(name: 'interested_genders') List<String> interestedGenders,
      List<UserEducation> education,
      UserHometown hometown});

  $ReligionCopyWith<$Res>? get religion;
  $PreferenceCopyWith<$Res>? get smoking;
  $PreferenceCopyWith<$Res>? get food;
  $PreferenceCopyWith<$Res>? get drinking;
  $PreferenceCopyWith<$Res>? get children;
  $PreferenceCopyWith<$Res>? get exercise;
  $UserHometownCopyWith<$Res> get hometown;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? course = freezed,
    Object? industry = freezed,
    Object? company = freezed,
    Object? university = freezed,
    Object? workTitle = freezed,
    Object? birthday = freezed,
    Object? gender = freezed,
    Object? linkedInURL = freezed,
    Object? age = freezed,
    Object? linkedInPublic = freezed,
    Object? bio = freezed,
    Object? searchRadius = freezed,
    Object? interestedAgeLower = freezed,
    Object? interestedAgeUpper = freezed,
    Object? religion = freezed,
    Object? smoking = freezed,
    Object? food = freezed,
    Object? drinking = freezed,
    Object? children = freezed,
    Object? exercise = freezed,
    Object? height = freezed,
    Object? status = freezed,
    Object? languages = freezed,
    Object? interestedGenders = freezed,
    Object? education = freezed,
    Object? hometown = freezed,
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
      course: course == freezed
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String?,
      industry: industry == freezed
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String?,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      university: university == freezed
          ? _value.university
          : university // ignore: cast_nullable_to_non_nullable
              as String?,
      workTitle: workTitle == freezed
          ? _value.workTitle
          : workTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedInURL: linkedInURL == freezed
          ? _value.linkedInURL
          : linkedInURL // ignore: cast_nullable_to_non_nullable
              as String?,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      linkedInPublic: linkedInPublic == freezed
          ? _value.linkedInPublic
          : linkedInPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      searchRadius: searchRadius == freezed
          ? _value.searchRadius
          : searchRadius // ignore: cast_nullable_to_non_nullable
              as int?,
      interestedAgeLower: interestedAgeLower == freezed
          ? _value.interestedAgeLower
          : interestedAgeLower // ignore: cast_nullable_to_non_nullable
              as int?,
      interestedAgeUpper: interestedAgeUpper == freezed
          ? _value.interestedAgeUpper
          : interestedAgeUpper // ignore: cast_nullable_to_non_nullable
              as int?,
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
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      interestedGenders: interestedGenders == freezed
          ? _value.interestedGenders
          : interestedGenders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      education: education == freezed
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as List<UserEducation>,
      hometown: hometown == freezed
          ? _value.hometown
          : hometown // ignore: cast_nullable_to_non_nullable
              as UserHometown,
    ));
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
  $UserHometownCopyWith<$Res> get hometown {
    return $UserHometownCopyWith<$Res>(_value.hometown, (value) {
      return _then(_value.copyWith(hometown: value));
    });
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String? course,
      String? industry,
      String? company,
      String? university,
      @JsonKey(name: 'work_title') String? workTitle,
      String? birthday,
      String? gender,
      @JsonKey(name: 'linkedin_url') String? linkedInURL,
      int? age,
      @JsonKey(name: 'linkedin_public') bool? linkedInPublic,
      String? bio,
      @JsonKey(name: 'search_radius') int? searchRadius,
      @JsonKey(name: 'interested_age_lower') int? interestedAgeLower,
      @JsonKey(name: 'interested_age_upper') int? interestedAgeUpper,
      Religion? religion,
      @JsonKey(name: 'smoking_preference') Preference? smoking,
      @JsonKey(name: 'food_preference') Preference? food,
      @JsonKey(name: 'drinking_preference') Preference? drinking,
      @JsonKey(name: 'children_preference') Preference? children,
      @JsonKey(name: 'exercise_preference') Preference? exercise,
      @JsonKey(name: 'height_in_cms') int? height,
      String? status,
      List<Language> languages,
      @JsonKey(name: 'interested_genders') List<String> interestedGenders,
      List<UserEducation> education,
      UserHometown hometown});

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
  $UserHometownCopyWith<$Res> get hometown;
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? course = freezed,
    Object? industry = freezed,
    Object? company = freezed,
    Object? university = freezed,
    Object? workTitle = freezed,
    Object? birthday = freezed,
    Object? gender = freezed,
    Object? linkedInURL = freezed,
    Object? age = freezed,
    Object? linkedInPublic = freezed,
    Object? bio = freezed,
    Object? searchRadius = freezed,
    Object? interestedAgeLower = freezed,
    Object? interestedAgeUpper = freezed,
    Object? religion = freezed,
    Object? smoking = freezed,
    Object? food = freezed,
    Object? drinking = freezed,
    Object? children = freezed,
    Object? exercise = freezed,
    Object? height = freezed,
    Object? status = freezed,
    Object? languages = freezed,
    Object? interestedGenders = freezed,
    Object? education = freezed,
    Object? hometown = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      course: course == freezed
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String?,
      industry: industry == freezed
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String?,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      university: university == freezed
          ? _value.university
          : university // ignore: cast_nullable_to_non_nullable
              as String?,
      workTitle: workTitle == freezed
          ? _value.workTitle
          : workTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedInURL: linkedInURL == freezed
          ? _value.linkedInURL
          : linkedInURL // ignore: cast_nullable_to_non_nullable
              as String?,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      linkedInPublic: linkedInPublic == freezed
          ? _value.linkedInPublic
          : linkedInPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      searchRadius: searchRadius == freezed
          ? _value.searchRadius
          : searchRadius // ignore: cast_nullable_to_non_nullable
              as int?,
      interestedAgeLower: interestedAgeLower == freezed
          ? _value.interestedAgeLower
          : interestedAgeLower // ignore: cast_nullable_to_non_nullable
              as int?,
      interestedAgeUpper: interestedAgeUpper == freezed
          ? _value.interestedAgeUpper
          : interestedAgeUpper // ignore: cast_nullable_to_non_nullable
              as int?,
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
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      interestedGenders: interestedGenders == freezed
          ? _value.interestedGenders
          : interestedGenders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      education: education == freezed
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as List<UserEducation>,
      hometown: hometown == freezed
          ? _value.hometown
          : hometown // ignore: cast_nullable_to_non_nullable
              as UserHometown,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {required this.id,
      required this.name,
      this.course,
      this.industry,
      this.company,
      this.university,
      @JsonKey(name: 'work_title') this.workTitle,
      this.birthday,
      this.gender,
      @JsonKey(name: 'linkedin_url') this.linkedInURL,
      this.age,
      @JsonKey(name: 'linkedin_public') this.linkedInPublic,
      this.bio,
      @JsonKey(name: 'search_radius') this.searchRadius,
      @JsonKey(name: 'interested_age_lower') this.interestedAgeLower,
      @JsonKey(name: 'interested_age_upper') this.interestedAgeUpper,
      this.religion,
      @JsonKey(name: 'smoking_preference') this.smoking,
      @JsonKey(name: 'food_preference') this.food,
      @JsonKey(name: 'drinking_preference') this.drinking,
      @JsonKey(name: 'children_preference') this.children,
      @JsonKey(name: 'exercise_preference') this.exercise,
      @JsonKey(name: 'height_in_cms') this.height,
      this.status,
      required this.languages,
      @JsonKey(name: 'interested_genders') required this.interestedGenders,
      required this.education,
      required this.hometown})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? course;
  @override
  final String? industry;
  @override
  final String? company;
  @override
  final String? university;
  @override
  @JsonKey(name: 'work_title')
  final String? workTitle;
  @override
  final String? birthday;
  @override
  final String? gender;
  @override
  @JsonKey(name: 'linkedin_url')
  final String? linkedInURL;
  @override
  final int? age;
  @override
  @JsonKey(name: 'linkedin_public')
  final bool? linkedInPublic;
  @override
  final String? bio;
  @override
  @JsonKey(name: 'search_radius')
  final int? searchRadius;
  @override
  @JsonKey(name: 'interested_age_lower')
  final int? interestedAgeLower;
  @override
  @JsonKey(name: 'interested_age_upper')
  final int? interestedAgeUpper;
  @override
  final Religion? religion;
  @override
  @JsonKey(name: 'smoking_preference')
  final Preference? smoking;
  @override
  @JsonKey(name: 'food_preference')
  final Preference? food;
  @override
  @JsonKey(name: 'drinking_preference')
  final Preference? drinking;
  @override
  @JsonKey(name: 'children_preference')
  final Preference? children;
  @override
  @JsonKey(name: 'exercise_preference')
  final Preference? exercise;
  @override
  @JsonKey(name: 'height_in_cms')
  final int? height;
  @override
  final String? status;
  @override
  final List<Language> languages;
  @override
  @JsonKey(name: 'interested_genders')
  final List<String> interestedGenders;
  @override
  final List<UserEducation> education;
  @override
  final UserHometown hometown;

  @override
  String toString() {
    return 'User(id: $id, name: $name, course: $course, industry: $industry, company: $company, university: $university, workTitle: $workTitle, birthday: $birthday, gender: $gender, linkedInURL: $linkedInURL, age: $age, linkedInPublic: $linkedInPublic, bio: $bio, searchRadius: $searchRadius, interestedAgeLower: $interestedAgeLower, interestedAgeUpper: $interestedAgeUpper, religion: $religion, smoking: $smoking, food: $food, drinking: $drinking, children: $children, exercise: $exercise, height: $height, status: $status, languages: $languages, interestedGenders: $interestedGenders, education: $education, hometown: $hometown)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.course, course) &&
            const DeepCollectionEquality().equals(other.industry, industry) &&
            const DeepCollectionEquality().equals(other.company, company) &&
            const DeepCollectionEquality()
                .equals(other.university, university) &&
            const DeepCollectionEquality().equals(other.workTitle, workTitle) &&
            const DeepCollectionEquality().equals(other.birthday, birthday) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality()
                .equals(other.linkedInURL, linkedInURL) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality()
                .equals(other.linkedInPublic, linkedInPublic) &&
            const DeepCollectionEquality().equals(other.bio, bio) &&
            const DeepCollectionEquality()
                .equals(other.searchRadius, searchRadius) &&
            const DeepCollectionEquality()
                .equals(other.interestedAgeLower, interestedAgeLower) &&
            const DeepCollectionEquality()
                .equals(other.interestedAgeUpper, interestedAgeUpper) &&
            const DeepCollectionEquality().equals(other.religion, religion) &&
            const DeepCollectionEquality().equals(other.smoking, smoking) &&
            const DeepCollectionEquality().equals(other.food, food) &&
            const DeepCollectionEquality().equals(other.drinking, drinking) &&
            const DeepCollectionEquality().equals(other.children, children) &&
            const DeepCollectionEquality().equals(other.exercise, exercise) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.languages, languages) &&
            const DeepCollectionEquality()
                .equals(other.interestedGenders, interestedGenders) &&
            const DeepCollectionEquality().equals(other.education, education) &&
            const DeepCollectionEquality().equals(other.hometown, hometown));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(course),
        const DeepCollectionEquality().hash(industry),
        const DeepCollectionEquality().hash(company),
        const DeepCollectionEquality().hash(university),
        const DeepCollectionEquality().hash(workTitle),
        const DeepCollectionEquality().hash(birthday),
        const DeepCollectionEquality().hash(gender),
        const DeepCollectionEquality().hash(linkedInURL),
        const DeepCollectionEquality().hash(age),
        const DeepCollectionEquality().hash(linkedInPublic),
        const DeepCollectionEquality().hash(bio),
        const DeepCollectionEquality().hash(searchRadius),
        const DeepCollectionEquality().hash(interestedAgeLower),
        const DeepCollectionEquality().hash(interestedAgeUpper),
        const DeepCollectionEquality().hash(religion),
        const DeepCollectionEquality().hash(smoking),
        const DeepCollectionEquality().hash(food),
        const DeepCollectionEquality().hash(drinking),
        const DeepCollectionEquality().hash(children),
        const DeepCollectionEquality().hash(exercise),
        const DeepCollectionEquality().hash(height),
        const DeepCollectionEquality().hash(status),
        const DeepCollectionEquality().hash(languages),
        const DeepCollectionEquality().hash(interestedGenders),
        const DeepCollectionEquality().hash(education),
        const DeepCollectionEquality().hash(hometown)
      ]);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  factory _User(
      {required int id,
      required String name,
      String? course,
      String? industry,
      String? company,
      String? university,
      @JsonKey(name: 'work_title')
          String? workTitle,
      String? birthday,
      String? gender,
      @JsonKey(name: 'linkedin_url')
          String? linkedInURL,
      int? age,
      @JsonKey(name: 'linkedin_public')
          bool? linkedInPublic,
      String? bio,
      @JsonKey(name: 'search_radius')
          int? searchRadius,
      @JsonKey(name: 'interested_age_lower')
          int? interestedAgeLower,
      @JsonKey(name: 'interested_age_upper')
          int? interestedAgeUpper,
      Religion? religion,
      @JsonKey(name: 'smoking_preference')
          Preference? smoking,
      @JsonKey(name: 'food_preference')
          Preference? food,
      @JsonKey(name: 'drinking_preference')
          Preference? drinking,
      @JsonKey(name: 'children_preference')
          Preference? children,
      @JsonKey(name: 'exercise_preference')
          Preference? exercise,
      @JsonKey(name: 'height_in_cms')
          int? height,
      String? status,
      required List<Language> languages,
      @JsonKey(name: 'interested_genders')
          required List<String> interestedGenders,
      required List<UserEducation> education,
      required UserHometown hometown}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get course;
  @override
  String? get industry;
  @override
  String? get company;
  @override
  String? get university;
  @override
  @JsonKey(name: 'work_title')
  String? get workTitle;
  @override
  String? get birthday;
  @override
  String? get gender;
  @override
  @JsonKey(name: 'linkedin_url')
  String? get linkedInURL;
  @override
  int? get age;
  @override
  @JsonKey(name: 'linkedin_public')
  bool? get linkedInPublic;
  @override
  String? get bio;
  @override
  @JsonKey(name: 'search_radius')
  int? get searchRadius;
  @override
  @JsonKey(name: 'interested_age_lower')
  int? get interestedAgeLower;
  @override
  @JsonKey(name: 'interested_age_upper')
  int? get interestedAgeUpper;
  @override
  Religion? get religion;
  @override
  @JsonKey(name: 'smoking_preference')
  Preference? get smoking;
  @override
  @JsonKey(name: 'food_preference')
  Preference? get food;
  @override
  @JsonKey(name: 'drinking_preference')
  Preference? get drinking;
  @override
  @JsonKey(name: 'children_preference')
  Preference? get children;
  @override
  @JsonKey(name: 'exercise_preference')
  Preference? get exercise;
  @override
  @JsonKey(name: 'height_in_cms')
  int? get height;
  @override
  String? get status;
  @override
  List<Language> get languages;
  @override
  @JsonKey(name: 'interested_genders')
  List<String> get interestedGenders;
  @override
  List<UserEducation> get education;
  @override
  UserHometown get hometown;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
