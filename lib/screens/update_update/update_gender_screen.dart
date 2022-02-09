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
import 'package:baetobe/domain/form_states/gender_state_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/data/gender.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UpdateGenderScreen extends HookConsumerWidget {
  final bool? redirectBack;

  const UpdateGenderScreen(
      {Key? key, @QueryParam('redirectBack') this.redirectBack})
      : super(key: key);

  List<Widget> _tiles(
      BuildContext context,
      GenderListing genderListing,
      List<int> selected,
      void Function(int value) onTap,
      void Function() onSubmit) {
    List<Widget> result = [];

    bool defaultSelected = false;

    for (var gender in genderListing.defaultGenders) {
      bool isSelected = selected.contains(gender.id);

      if (gender.name == 'All') {
        continue;
      }

      result.add(SelectTile(
          title: gender.name,
          selected: isSelected,
          onTap: () => onTap(gender.id)));

      if (isSelected) {
        defaultSelected = true;
      }
    }

    if (selected.isNotEmpty && !defaultSelected) {
      Gender selection = genderListing.allGenders
          .firstWhere((gender) => selected.contains(gender.id));

      result.add(SelectTile(
          title: selection.name,
          selected: true,
          onTap: () => onTap(selection.id)));
    }

    result.add(ViewMoreGenders(
      onSubmit: onSubmit,
      onSelect: (int id) => onTap(id),
      selectionNotifier: genderStateProvider,
      heading: Headings.gender,
    ));
    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genderListing = ref.watch(genderProvider);
    final state = ref.watch(genderStateProvider);
    void onSubmit() {
      ref.read(userProvider.notifier).updateAttributes(
          {'gender_id': state.first},
          routeTo: redirectBack == true
              ? AppLinks.back
              : AppLinks.updateInterestedGenders);
    }

    return FormLayout(
        header: redirectBack == true
            ? const CustomHeaderTile(
                text: Headings.gender,
                headerWith: HeaderWith.chevron,
              )
            : null,
        children: <Widget>[
          redirectBack == true
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 36.0),
                  child: Container(),
                )
              : Column(
                  children: [
                    const SizedBox(height: 32),
                    const CustomTextWidget(
                            type: textWidgetType.heading5,
                            text: Headings.enterGender,
                            withRow: false)
                        .padding(top: 32, bottom: 36, horizontal: 10),
                  ],
                ),
          genderListing.maybeWhen(
              data: (GenderListing listing) => Column(
                    children: _tiles(context, listing, state, (int value) {
                      ref.read(genderStateProvider.notifier).state = [value];
                    }, onSubmit),
                  ),
              orElse: () => Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor))),
        ],
        floatingSubmit: FloatingCta(
          icon: redirectBack == true
              ? FontAwesomeIcons.solidSave
              : FontAwesomeIcons.chevronRight,
          enabled: state.isNotEmpty,
          onPressed: onSubmit,
        ));
  }
}
