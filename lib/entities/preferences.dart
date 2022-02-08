import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/entities/data/user.dart';

abstract class Preferences {
  String backendRoute();
  String heading();
  String jsonName();
  int? userSelectedValue(User user);

  factory Preferences(String preferenceFor) {
    switch (preferenceFor) {
      case PreferenceKey.smoking:
        return _SmokingPreferences();
      case PreferenceKey.food:
        return _FoodPreference();
      case PreferenceKey.children:
        return _ChildrenPreference();
      case PreferenceKey.drinking:
        return _DrinkingPreference();
      case PreferenceKey.exercise:
        return _ExercisePreferences();
      default:
        throw "Can't find $preferenceFor.";
    }
  }
}

class _SmokingPreferences implements Preferences {
  @override
  String backendRoute() {
    return BackendRoutes.listSmokingPreferences;
  }

  @override
  String heading() {
    return Headings.smokingPreference;
  }

  @override
  String jsonName() {
    return 'smoking_preference_id';
  }

  @override
  int? userSelectedValue(user) {
    return user.smoking?.id;
  }
}

class _DrinkingPreference implements Preferences {
  @override
  String backendRoute() {
    return BackendRoutes.listDrinkingPreferences;
  }

  @override
  String heading() {
    return Headings.drinkingPreference;
  }

  @override
  String jsonName() {
    return 'drinking_preference_id';
  }

  @override
  int? userSelectedValue(user) {
    return user.drinking?.id;
  }
}

class _ChildrenPreference implements Preferences {
  @override
  String backendRoute() {
    return BackendRoutes.listChildrenPreferences;
  }

  @override
  String heading() {
    return Headings.childrenPreference;
  }

  @override
  String jsonName() {
    return 'children_preference_id';
  }

  @override
  int? userSelectedValue(user) {
    return user.children?.id;
  }
}

class _FoodPreference implements Preferences {
  @override
  String backendRoute() {
    return BackendRoutes.listFoodPreferences;
  }

  @override
  String heading() {
    return Headings.foodPreference;
  }

  @override
  String jsonName() {
    return 'food_preference_id';
  }

  @override
  int? userSelectedValue(user) {
    return user.food?.id;
  }
}

class _ExercisePreferences implements Preferences {
  @override
  String backendRoute() {
    return BackendRoutes.listExercisePreferences;
  }

  @override
  String heading() {
    return Headings.exercisePreference;
  }

  @override
  String jsonName() {
    return 'exercise_preference_id';
  }

  @override
  int? userSelectedValue(user) {
    return user.exercise?.id;
  }
}
