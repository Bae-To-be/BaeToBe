import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/industries_provider.dart';
import 'package:baetobe/screens/user_update/update_work_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IndustryField extends HookConsumerWidget {
  const IndustryField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final industries = ref.watch(industriesProvider);
    final state = ref.watch(workFormStateProvider);

    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      child: GFDropdown<int>(
        dropdownButtonColor: const Color(0xFFF2F2F2),
        iconEnabledColor: Theme.of(context).primaryColor,
        iconDisabledColor: Theme.of(context).primaryColor,
        isExpanded: true,
        value: state.industryId,
        onChanged: (Object? value) {
          ref.read(workFormStateProvider.notifier).state =
              state.copyWith(newIndustryId: value as int);
        },
        hint: const Text(
          InfoLabels.selectIndustry,
        ),
        items: industries.maybeWhen(
          data: (industriesList) {
            return industriesList
                .map((value) => DropdownMenuItem(
                      value: value.id,
                      child: Text(value.name),
                    ))
                .toList();
          },
          orElse: () => [],
        ),
      ),
    );
  }
}
