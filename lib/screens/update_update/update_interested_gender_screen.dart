import 'package:auto_route/annotations.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/forms/select_tile.dart';
import 'package:baetobe/components/gender/view_more_genders.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/gender_provider.dart';
import 'package:baetobe/domain/form_states/interested_gender_state_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/generated/gender.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UpdateInterestedGenderScreen extends HookConsumerWidget {
  final bool? redirectBack;

  const UpdateInterestedGenderScreen(
      {Key? key, @QueryParam('redirectBack') this.redirectBack})
      : super(key: key);

  List<Widget> _tiles(
      BuildContext context,
      GenderListing genderListing,
      List<int> selected,
      void Function(int value) onTap,
      void Function() onSubmit) {
    List<Widget> result = [];

    for (var gender in genderListing.defaultGenders) {
      bool isSelected = selected.contains(gender.id);

      result.add(SelectTile(
          title: gender.name,
          selected: isSelected,
          onTap: () => onTap(gender.id)));
    }

    if (selected.isNotEmpty) {
      Iterable<Gender> selections = genderListing.allGenders.where((gender) =>
          selected.contains(gender.id) &&
          !genderListing.defaultGenders.contains(gender));

      for (var selection in selections) {
        result.add(SelectTile(
            title: selection.name,
            selected: true,
            onTap: () => onTap(selection.id)));
      }
    }

    result.add(ViewMoreGenders(
      onSubmit: onSubmit,
      excludeAll: false,
      onSelect: (int id) => onTap(id),
      selectionNotifier: interestedGenderStateProvider,
      heading: Headings.interestedIn,
    ));
    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genderListing = ref.watch(genderProvider);
    final state = ref.watch(interestedGenderStateProvider);

    void onSubmit() {
      ref.read(userProvider.notifier).updateAttributes(
          {'interested_gender_ids': state},
          routeTo: redirectBack == true
              ? AppLinks.back
              : AppLinks.updateWorkDetails);
    }

    return FormLayout(
        header: redirectBack == true
            ? const CustomHeaderTile(text: Headings.interestedIn)
            : null,
        children: <Widget>[
          redirectBack == true
              ? Container()
              : Column(
                  children: [
                    const SizedBox(height: 32),
                    const CustomTextWidget(
                            type: textWidgetType.heading5,
                            text: Headings.enterInterestedGender)
                        .padding(top: 32, bottom: 36, left: 10),
                  ],
                ),
          genderListing
              .maybeWhen(
                  data: (GenderListing listing) => ListView(
                        shrinkWrap: true,
                        children: _tiles(context, listing, state, (int value) {
                          final currentState = ref
                              .read(interestedGenderStateProvider.notifier)
                              .state;
                          final allGenders = genderListing.value?.defaultGenders
                              .firstWhereOrNull(
                                  (gender) => gender.name == 'All');
                          if (currentState.contains(value)) {
                            ref
                                    .read(interestedGenderStateProvider.notifier)
                                    .state =
                                currentState
                                    .where((id) => id != value)
                                    .toList();
                            return;
                          }
                          if (allGenders != null) {
                            if (currentState.contains(allGenders.id)) {
                              return;
                            }
                            if (value == allGenders.id) {
                              ref
                                  .read(interestedGenderStateProvider.notifier)
                                  .state = [value];
                              return;
                            }
                          }
                          ref
                              .read(interestedGenderStateProvider.notifier)
                              .state = [...currentState, value];
                        }, onSubmit),
                      ),
                  orElse: () => Center(
                      child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor)))
              .padding(top: 36),
        ],
        floatingSubmit: FloatingCta(
          enabled: state.isNotEmpty,
          onPressed: onSubmit,
        ));
  }
}
