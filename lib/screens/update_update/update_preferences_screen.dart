import 'package:auto_route/annotations.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/forms/select_tile.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/preferences_provider.dart';
import 'package:baetobe/domain/form_states/preferences_state_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/data/user.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UpdatePreferencesScreen extends HookConsumerWidget {
  final String preferenceFor;

  const UpdatePreferencesScreen(
      {Key? key, @pathParam required this.preferenceFor})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final preferencesHandler = Preferences(preferenceFor, user);
    final preferenceListing =
        ref.watch(preferencesProvider(preferencesHandler));
    final state = ref.watch(preferencesStateProvider(preferencesHandler));

    void onSubmit() {
      ref.read(userProvider.notifier).updateAttributes(
          {preferencesHandler.jsonName(): state},
          routeTo: AppLinks.back);
    }

    return FormLayout(
        header: CustomHeaderTile(text: preferencesHandler.heading()),
        children: <Widget>[
          preferenceListing
              .maybeWhen(
                  data: (listing) => ListView.builder(
                      itemCount: listing.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        bool isSelected = state == listing[index].id;

                        return SelectTile(
                            title: listing[index].name,
                            selected: isSelected,
                            onTap: () => ref
                                .read(
                                    preferencesStateProvider(preferencesHandler)
                                        .notifier)
                                .state = listing[index].id);
                      }),
                  orElse: () => Center(
                        child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor),
                      ))
              .padding(top: 36),
        ],
        floatingSubmit: FloatingCta(
          enabled: state != null,
          onPressed: onSubmit,
        ));
  }
}

abstract class Preferences {
  String backendRoute();
  String heading();
  String jsonName();
  int? userSelectedValue();

  factory Preferences(String preferenceFor, User user) {
    switch (preferenceFor) {
      case PreferenceKey.smoking:
        return _SmokingPreferences(user);
      case PreferenceKey.food:
        return _FoodPreference(user);
      case PreferenceKey.children:
        return _ChildrenPreference(user);
      case PreferenceKey.drinking:
        return _DrinkingPreference(user);
      case PreferenceKey.exercise:
        return _ExercisePreferences(user);
      default:
        throw "Can't find $preferenceFor.";
    }
  }
}

class _SmokingPreferences implements Preferences {
  final User user;
  _SmokingPreferences(this.user);

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
  int? userSelectedValue() {
    return user.smoking?.id;
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is _SmokingPreferences &&
          runtimeType == other.runtimeType &&
          user == other.user;

  @override
  int get hashCode => user.hashCode;
}

class _DrinkingPreference implements Preferences {
  final User user;
  _DrinkingPreference(this.user);

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
  int? userSelectedValue() {
    return user.drinking?.id;
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is _DrinkingPreference &&
          runtimeType == other.runtimeType &&
          user == other.user;

  @override
  int get hashCode => user.hashCode;
}

class _ChildrenPreference implements Preferences {
  final User user;
  _ChildrenPreference(this.user);

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
  int? userSelectedValue() {
    return user.children?.id;
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is _ChildrenPreference &&
          runtimeType == other.runtimeType &&
          user == other.user;

  @override
  int get hashCode => user.hashCode;
}

class _FoodPreference implements Preferences {
  final User user;
  _FoodPreference(this.user);

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
  int? userSelectedValue() {
    return user.food?.id;
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is _FoodPreference &&
          runtimeType == other.runtimeType &&
          user == other.user;

  @override
  int get hashCode => user.hashCode;
}

class _ExercisePreferences implements Preferences {
  final User user;
  _ExercisePreferences(this.user);

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
  int? userSelectedValue() {
    return user.exercise?.id;
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is _ExercisePreferences &&
          runtimeType == other.runtimeType &&
          user == other.user;

  @override
  int get hashCode => user.hashCode;
}
