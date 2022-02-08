import 'package:auto_route/annotations.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/forms/select_tile.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/preferences_provider.dart';
import 'package:baetobe/domain/form_states/preferences_state_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../constants/app_constants.dart';
import '../../entities/data/user.dart';

class UpdatePreferencesScreen extends HookConsumerWidget {
  final String preferenceFor;

  const UpdatePreferencesScreen(
      {Key? key, @pathParam required this.preferenceFor})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final preferenceListing = ref
        .watch(preferencesProvider(Preferences(preferenceFor).backendRoute()));
    final state = ref.watch(preferencesStateProvider(
        Preferences(preferenceFor).userSelectedValue(user)));

    void onSubmit() {
      ref.read(userProvider.notifier).updateAttributes(
          {Preferences(preferenceFor).jsonName(): state},
          routeTo: AppLinks.back);
    }

    return FormLayout(
        header: CustomHeaderTile(text: Preferences(preferenceFor).heading()),
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
                                .read(preferencesStateProvider(
                                        Preferences(preferenceFor)
                                            .userSelectedValue(user))
                                    .notifier)
                                .state = listing[index].id);
                      }),
                  orElse: () => Center(
                      child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor)))
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
  int? userSelectedValue(User user) {
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
  int? userSelectedValue(User user) {
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
  int? userSelectedValue(User user) {
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
  int? userSelectedValue(User user) {
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
  int? userSelectedValue(User user) {
    return user.exercise?.id;
  }
}
