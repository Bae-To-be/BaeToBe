import 'package:baetobe/entities/generated/language.dart';
import 'package:baetobe/entities/generated/preference.dart';
import 'package:baetobe/entities/generated/religion.dart';
import 'package:baetobe/entities/generated/user_education.dart';
import 'package:baetobe/entities/generated/user_hometown.dart';
import 'package:baetobe/entities/generated/user_image.dart';
import 'package:baetobe/entities/match.dart';

class DetailedProfile {
  int id;
  String name;
  String gender;
  int age;
  String workTitle;
  String company;
  String industry;
  String? linkedinUrl;
  String? bio;
  UserHometown hometown;
  Religion? religion;
  Preference? smoking;
  Preference? food;
  Preference? drinking;
  Preference? children;
  int? heightInCms;
  String matchStatus;
  Match? match;
  bool isReported;
  List<Language> languages;
  List<UserEducation> education;
  List<UserImage> images;

  DetailedProfile({
    required this.id,
    required this.name,
    required this.gender,
    required this.age,
    required this.workTitle,
    required this.company,
    required this.industry,
    required this.linkedinUrl,
    required this.bio,
    required this.hometown,
    required this.religion,
    required this.drinking,
    required this.smoking,
    required this.food,
    required this.children,
    required this.heightInCms,
    required this.languages,
    required this.education,
    required this.isReported,
    required this.images,
    required this.matchStatus,
    required this.match,
  });

  factory DetailedProfile.fromJson(Map<String, dynamic> json) {
    List<UserEducation> education = [];
    List<Language> languages = [];
    List<UserImage> images = [];

    for (var element
        in List<Map<String, dynamic>>.from(json['education'] ?? [])) {
      education.add(UserEducation.fromJson(element));
    }

    for (var element
        in List<Map<String, dynamic>>.from(json['languages'] ?? [])) {
      languages.add(Language.fromJson(element));
    }

    for (var element in List<Map<String, dynamic>>.from(json['images'] ?? [])) {
      images.add(UserImage.fromJson(element));
    }

    return DetailedProfile(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      industry: json['industry'],
      company: json['company'],
      workTitle: json['work_title'],
      isReported: json['is_reported'],
      age: json['age'],
      bio: json['bio'],
      linkedinUrl: json['linkedin_url'],
      matchStatus: json['status'],
      match: json['match'] == null ? null : Match.fromJson(json['match']),
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
      heightInCms: json['height_in_cms'],
      images: images,
      education: education,
      languages: languages,
    );
  }

  @override
  String toString() {
    return {
      'id': id,
      'match_status': matchStatus,
      'name': name,
      'gender': gender,
      'industry': industry,
      'company': company,
      'work_title': workTitle,
      'age': age,
      'bio': bio,
      'is_reported': isReported,
      'linkedin_url': linkedinUrl,
      'religion': religion.toString(),
      'smoking_preference': smoking.toString(),
      'food_preference': food.toString(),
      'children_preference': children.toString(),
      'hometown': hometown.toString(),
      'height_in_cms': heightInCms.toString(),
      'education': education.toString(),
      'languages': languages.toString(),
    }.toString();
  }
}

class UserProfile {
  int id;
  String name;
  String gender;
  int age;
  String workTitle;
  String company;
  String industry;
  List<UserImage> images;

  UserProfile({
    required this.id,
    required this.name,
    required this.gender,
    required this.age,
    required this.workTitle,
    required this.company,
    required this.industry,
    required this.images,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    List<UserImage> images = [];
    for (var element in List<Map<String, dynamic>>.from(json['images'])) {
      images.add(UserImage.fromJson(element));
    }

    return UserProfile(
        id: json['id'],
        age: json['age'],
        company: json['company'],
        industry: json['industry'],
        workTitle: json['work_title'],
        name: json['name'],
        images: images,
        gender: json['gender']);
  }

  String? profilePictureUrl() {
    if (images.isEmpty) {
      return null;
    }

    return images
        .reduce((currentImage, nextImage) =>
            currentImage.position < nextImage.position
                ? currentImage
                : nextImage)
        .url;
  }
}
