import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/form_states/preferences_form_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UpdateMatchingPreferences extends HookConsumerWidget {
  const UpdateMatchingPreferences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(matchingPreferencesFormStateProvider);

    return Column(
      children: [
        const CustomHeaderTile(
          text: Headings.preferences,
        ),
        CustomTextWidget(
          text: 'Distance (${state.currentRadius()} Kms)',
          type: textWidgetType.subtitle1,
        ).padding(left: 25),
        Slider(
          value: state.currentRadius(),
          min: 0,
          max: 50,
          divisions: 100,
          onChanged: ref
              .read(matchingPreferencesFormStateProvider.notifier)
              .updateSearchRadius,
        ).padding(horizontal: 15, vertical: 15),
        CustomTextWidget(
          text:
              'Age  (${state.interestedInAgeLower} - ${state.interestedInAgeUpper} years)',
          type: textWidgetType.subtitle1,
        ).padding(left: 25),
        RangeSlider(
                min: 18,
                max: 70,
                values: RangeValues(state.interestedInAgeLower.toDouble(),
                    state.interestedInAgeUpper.toDouble()),
                onChanged: ref
                    .read(matchingPreferencesFormStateProvider.notifier)
                    .updateAgeRange)
            .padding(horizontal: 30, vertical: 15)
      ],
    );
  }
}
