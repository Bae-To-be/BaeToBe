import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/forms/auto_complete_field.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/countries_provider.dart';
import 'package:baetobe/domain/background_fields/suggestions.dart';
import 'package:baetobe/domain/form_states/hometown_state_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UpdateHometownScreen extends HookConsumerWidget {
  const UpdateHometownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(hometownStateProvider);
    final countries = ref.watch(countriesProvider);

    final cityNameController = useTextEditingController
        .fromValue(TextEditingValue(text: state.cityName ?? ''));
    cityNameController.addListener(() {
      if (ref.read(hometownStateProvider.notifier).state.cityName !=
          cityNameController.text) {
        ref.read(hometownStateProvider.notifier).state = ref
            .read(hometownStateProvider.notifier)
            .state
            .copyWith(newCityName: cityNameController.text);
      }
    });
    return FormLayout(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Hometown',
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                ).padding(top: 24, bottom: 32),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Enter City',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                    AutoCompleteField(
                      textController: cityNameController,
                      hintText:
                          state.cityName == '' ? Placeholders.cityHint : '',
                      onSuggestionSelected: (String selection) {
                        cityNameController.text = selection;
                      },
                      suggestionsCallback: (String pattern) {
                        return suggestionsFor(
                            SuggestionEntity.city, pattern, ref);
                      },
                    ).padding(vertical: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Enter Country',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 32,
                      child: GFDropdown(
                        dropdownButtonColor: const Color(0xFFF2F2F2),
                        iconEnabledColor: Theme.of(context).primaryColor,
                        iconDisabledColor: Theme.of(context).primaryColor,
                        isExpanded: true,
                        value: state.countryName,
                        onChanged: (value) {
                          ref.read(hometownStateProvider.notifier).state = ref
                              .read(hometownStateProvider.notifier)
                              .state
                              .copyWith(newCountryName: value as String);
                        },
                        hint: const Text(
                          Placeholders.countryHint,
                        ),
                        items: countries.value
                            ?.map((value) => DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                ))
                            .toList(),
                      ),
                    ),
                    // const _CountryField(),
                  ],
                ).padding(horizontal: 8)
              ],
            ),
          ),
        ),
      ],
      floatingSubmit: FloatingCta(
        onPressed: () {
          ref.read(userProvider.notifier).updateAttributes(
              {'hometown': UserHometown(state.cityName!, state.countryName!)},
              routeTo: AppLinks.back);
        },
      ),
    );
  }
}
