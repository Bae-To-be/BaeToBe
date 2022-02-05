import 'dart:ui';

import 'package:baetobe/entities/generated/language.dart';
import 'package:baetobe/entities/generated/preference.dart';
import 'package:baetobe/entities/generated/religion.dart';
import 'package:baetobe/entities/generated/user_hometown.dart';

class User {
  static const String pausedStatus = 'paused';
  static const String activeStatus = 'active';

  int id;
  String name;
  String? course;
  String? industry;
  String? company;
  String? university;
  String? workTitle;
  String? birthday;
  String? gender;
  String? linkedInURL;
  int? age;
  bool? linkedInPublic;
  String? bio;
  int? searchRadius;
  int? interestedAgeLower;
  int? interestedAgeUpper;
  Religion? religion;
  Preference? smoking;
  Preference? food;
  Preference? drinking;
  Preference? children;
  int? height;
  String? status;
  List<Language> languages;
  List<String> interestedGenders;
  List<UserEducation> education;
  UserHometown hometown;

  User({
    required this.name,
    required this.id,
    this.course,
    this.birthday,
    this.company,
    this.university,
    this.gender,
    this.industry,
    this.workTitle,
    this.linkedInURL,
    this.age,
    this.bio,
    this.religion,
    this.linkedInPublic,
    this.food,
    this.drinking,
    this.smoking,
    this.children,
    this.height,
    this.searchRadius,
    this.interestedAgeLower,
    this.interestedAgeUpper,
    this.status,
    required this.education,
    required this.hometown,
    required this.interestedGenders,
    required this.languages,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    List<UserEducation> education = [];
    List<Language> languages = [];

    for (var element
        in List<Map<String, dynamic>>.from(json['education'] ?? [])) {
      education.add(UserEducation.fromJson(element));
    }

    for (var element
        in List<Map<String, dynamic>>.from(json['languages'] ?? [])) {
      languages.add(Language.fromJson(element));
    }

    return User(
      id: json['id'],
      name: json['name'],
      course: json['course'],
      gender: json['gender'],
      industry: json['industry'],
      university: json['university'],
      company: json['company'],
      workTitle: json['work_title'],
      birthday: json['birthday'],
      age: json['age'],
      bio: json['bio'],
      linkedInURL: json['linkedin_url'],
      linkedInPublic: json['linkedin_public'],
      searchRadius: json['search_radius'],
      interestedAgeLower: json['interested_age_lower'],
      interestedAgeUpper: json['interested_age_upper'],
      status: json['status'],
      religion: json['religion'] == null
          ? null
          : Religion.fromJson((json['religion'])),
      smoking: json['smoking_preference'] == null
          ? null
          : Preference.fromJson((json['smoking_preference'])),
      food: json['food_preference'] == null
          ? null
          : Preference.fromJson((json['food_preference'])),
      drinking: json['drinking_preference'] == null
          ? null
          : Preference.fromJson((json['drinking_preference'])),
      children: json['children_preference'] == null
          ? null
          : Preference.fromJson((json['children_preference'])),
      hometown: UserHometown.fromJson(json['hometown']),
      height: json['height_in_cms'],
      education: education,
      interestedGenders: List<String>.from(json['interested_genders'] ?? []),
      languages: languages,
    );
  }

  bool workInformationPresent() {
    return (workTitle != null && industry != null && company != null);
  }
}

class UserEducation {
  String courseName;
  String universityName;
  String year;

  UserEducation(this.courseName, this.universityName, this.year);

  factory UserEducation.fromJson(Map<String, dynamic> json) {
    return UserEducation(
        json['course'], json['university'], json['year'].toString());
  }

  UserEducation copyWith(
      {String? newCourseName, String? newUniversityName, String? newYear}) {
    return UserEducation(newCourseName ?? courseName,
        newUniversityName ?? universityName, newYear ?? year);
  }

  Map<String, dynamic> toJson() {
    return {
      'course_name': courseName,
      'university_name': universityName,
      'year': year
    };
  }

  @override
  bool operator ==(other) {
    return other is UserEducation &&
        (other.courseName == courseName) &&
        (other.universityName == universityName) &&
        (other.year == year);
  }

  @override
  int get hashCode =>
      hashValues(courseName.hashCode, universityName.hashCode, year.hashCode);

  @override
  String toString() {
    return toJson().toString();
  }

  bool allFieldsPresent() {
    return courseName != '' && universityName != '' && year != '';
  }
}

class UserVerificationFile {
  String fileType;
  String url;

  UserVerificationFile(this.fileType, this.url);

  factory UserVerificationFile.fromJson(Map<String, dynamic> json) {
    return UserVerificationFile(json['file_type'], json['url']);
  }

  @override
  String toString() {
    return {
      'file_type': fileType,
      'url': url,
    }.toString();
  }
}
