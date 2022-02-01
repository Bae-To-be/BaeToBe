import 'package:auto_route/auto_route.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/form_states/birthday_state_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/utils/datetime.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

final _eighteenYearsAgo = DateTime.now().subtract(const Duration(days: 6935));

class UpdateBirthdayScreen extends HookConsumerWidget {
  final bool? redirectBack;

  const UpdateBirthdayScreen(
      {Key? key, @QueryParam('redirectBack') this.redirectBack})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(birthdayStateProvider);

    return FormLayout(
        children: [
          const SizedBox(height: 32),
          const Heading5(text: Headings.enterBirthday)
              .padding(top: 32, bottom: 36, left: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SfDateRangePicker(
                  showNavigationArrow: true,
                  selectionColor: Theme.of(context).primaryColor,
                  initialDisplayDate: state,
                  initialSelectedDate: state,
                  onSelectionChanged: (value) => ref
                      .read(birthdayStateProvider.notifier)
                      .state = value.value,
                  maxDate: _eighteenYearsAgo,
                  minDate: DateTime(1950, 01, 01)),
            ],
          ),
          _AgeBar(),
          Text(
            InfoLabels.age,
            style: Theme.of(context).textTheme.caption,
          ).padding(vertical: 8).alignment(Alignment.center),
        ],
        floatingSubmit: FloatingCta(
          enabled: state != null,
          onPressed: () {
            ref.read(userProvider.notifier).updateAttributes(
                {'birthday': onlyDate.format(state!)},
                routeTo: redirectBack == true
                    ? AppLinks.back
                    : AppLinks.updateGender);
          },
        ));
  }
}

class _AgeBar extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ageState = ref.watch(ageProvider);

    if (ageState == null) {
      return Container();
    }

    return Text(
      'Age: ${(ageState.toString())}',
      style: Theme.of(context).textTheme.headline6,
    ).padding(horizontal: 10).alignment(Alignment.center);
  }
}
