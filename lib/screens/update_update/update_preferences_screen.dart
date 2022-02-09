import 'package:auto_route/annotations.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/forms/select_tile.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/domain/background_fields/preferences_provider.dart';
import 'package:baetobe/domain/form_states/preferences_state_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/preferences.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

//ignore: must_be_immutable
class UpdatePreferencesScreen extends HookConsumerWidget {
  final String preferenceFor;
  Preferences? preferencesHandler;

  UpdatePreferencesScreen({Key? key, @pathParam required this.preferenceFor})
      : super(key: key) {
    preferencesHandler = Preferences(preferenceFor);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferenceListing =
        ref.watch(preferencesProvider(preferencesHandler!));
    final state = ref.watch(preferencesStateProvider(preferencesHandler!));

    void onSubmit() {
      ref.read(userProvider.notifier).updateAttributes(
          {preferencesHandler!.jsonName(): state},
          routeTo: AppLinks.back);
    }

    return FormLayout(
        header: CustomHeaderTile(
          text: preferencesHandler!.heading(),
          headerWith: HeaderWith.chevron,
        ),
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
                                        preferencesHandler!)
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
          icon: FontAwesomeIcons.solidSave,
          enabled: state != null,
          onPressed: onSubmit,
        ));
  }
}
