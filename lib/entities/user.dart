import 'dart:ui';

import 'package:baetobe/entities/language.dart';
import 'package:baetobe/entities/preference.dart';
import 'package:baetobe/entities/religion.dart';

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

class UserHometown {
  String countryName;
  String cityName;

  UserHometown(this.cityName, this.countryName);

  factory UserHometown.fromJson(Map<String, dynamic> json) {
    String cityName = '';
    if (json['city'] != null) {
      cityName = json['city']['name'];
    }

    return UserHometown(cityName, json['country_name'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'country_name': countryName,
      'city_name': cityName,
    };
  }

  @override
  String toString() {
    if (cityName != '' && countryName != '') {
      return '$cityName, $countryName';
    }
    return '$cityName$countryName';
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

class UserImage {
  int position;
  String url;
  int id;

  UserImage(this.id, this.position, this.url);

  factory UserImage.fromJson(Map<String, dynamic> json) {
    return UserImage(json['id'] as int, json['position'] as int, json['url']);
  }

  @override
  String toString() {
    return {
      'id': id,
      'position': position,
      'url': url,
    }.toString();
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

class UserVerificationInfo {
  bool linkedinApproved;
  bool workDetailsApproved;
  bool educationApproved;
  bool dobApproved;
  bool selfieApproved;
  bool identityApproved;
  List<String> fieldsUpdated;
  String? rejectionReason;
  String status;

  UserVerificationInfo(
      {required this.linkedinApproved,
      required this.workDetailsApproved,
      required this.educationApproved,
      required this.dobApproved,
      required this.selfieApproved,
      required this.identityApproved,
      required this.fieldsUpdated,
      required this.status,
      this.rejectionReason});

  factory UserVerificationInfo.fromJson(Map<String, dynamic> json) {
    return UserVerificationInfo(
        linkedinApproved: json['linkedin_approved'],
        workDetailsApproved: json['work_details_approved'],
        educationApproved: json['education_approved'],
        dobApproved: json['dob_approved'],
        selfieApproved: json['selfie_approved'],
        identityApproved: json['identity_approved'],
        status: json['status'],
        fieldsUpdated: List<String>.from(json['fields_updated'] ?? []),
        rejectionReason: json['rejection_reason']);
  }

  @override
  String toString() {
    return {
      linkedinApproved: linkedinApproved,
      workDetailsApproved: workDetailsApproved,
      educationApproved: educationApproved,
      dobApproved: dobApproved,
      selfieApproved: selfieApproved,
      identityApproved: identityApproved,
      fieldsUpdated: fieldsUpdated,
      rejectionReason: rejectionReason
    }.toString();
  }
}
