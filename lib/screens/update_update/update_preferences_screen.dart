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

const preferenceBackendRoute = {
  PreferenceKey.smoking: BackendRoutes.listSmokingPreferences,
  PreferenceKey.children: BackendRoutes.listChildrenPreferences,
  PreferenceKey.food: BackendRoutes.listFoodPreferences,
  PreferenceKey.drinking: BackendRoutes.listDrinkingPreferences
};

const headingFor = {
  PreferenceKey.smoking: Headings.smokingPreference,
  PreferenceKey.children: Headings.childrenPreference,
  PreferenceKey.food: Headings.foodPreference,
  PreferenceKey.drinking: Headings.drinkingPreference
};

const jsonFor = {
  PreferenceKey.smoking: 'smoking_preference_id',
  PreferenceKey.children: 'children_preference_id',
  PreferenceKey.food: 'food_preference_id',
  PreferenceKey.drinking: 'drinking_preference_id'
};

class UpdatePreferencesScreen extends HookConsumerWidget {
  final String preferenceFor;

  const UpdatePreferencesScreen(
      {Key? key, @pathParam required this.preferenceFor})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferenceListing =
        ref.watch(preferencesProvider(preferenceBackendRoute[preferenceFor]!));
    final state = ref.watch(preferencesStateProvider(preferenceFor));

    void onSubmit() {
      ref.read(userProvider.notifier).updateAttributes(
          {jsonFor[preferenceFor]!: state},
          routeTo: AppLinks.back);
    }

    return FormLayout(
        header: CustomHeaderTile(text: headingFor[preferenceFor]!),
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
                                .read(preferencesStateProvider(preferenceFor)
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
