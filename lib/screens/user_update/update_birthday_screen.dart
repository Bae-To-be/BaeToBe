import 'package:baetobe/application/page_wrapper.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/user.dart';
import 'package:baetobe/utils/datetime.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

final _eighteenYearsAgo = DateTime.now().subtract(const Duration(days: 6935));

final _selected = StateProvider.autoDispose<DateTime?>((ref) {
  final user = ref.watch(userProvider);
  DateTime? result;
  if (user.value?.birthday != null) {
    result = onlyDate.parse(user.value!.birthday!);
  }
  return result;
});

final _age = Provider.autoDispose<num?>((ref) {
  final s = ref.watch(_selected);
  if (s == null) {
    return null;
  }

  DateTime currentDate = DateTime.now();
  num result = currentDate.year - s.year;

  if (s.month > currentDate.month) {
    result = result - 1;
  } else if (s.month == currentDate.month) {
    if (s.day > currentDate.day) {
      result = result - 1;
    }
  }
  return result;
});

class UpdateBirthdayScreen extends HookConsumerWidget {
  const UpdateBirthdayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<User> _user = ref.watch(userProvider);
    final _state = ref.watch(_selected);

    return PageWrapper(
      child: FormLayout(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  Headings.enterBirthday,
                  style: Theme.of(context).textTheme.headline5,
                ).padding(top: 32, bottom: 36),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SfDateRangePicker(
                    showNavigationArrow: true,
                    selectionColor: Theme.of(context).primaryColor,
                    initialDisplayDate: _state,
                    initialSelectedDate: _state,
                    onSelectionChanged: (value) =>
                        ref.read(_selected.notifier).state = value.value,
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
            color:
                _state != null ? Theme.of(context).primaryColor : Colors.grey,
            loading: _user is AsyncLoading,
            onPressed: () {
              if (_state == null) {
                return;
              }
              ref.read(userProvider.notifier).updateAttributes(
                  {'birthday': onlyDate.format(_state)},
                  routeTo: AppLinks.updateGender);
            },
          )),
    );
  }
}

class _AgeBar extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ageState = ref.watch(_age);

    if (ageState == null) {
      return Container();
    }

    return Text(
      'Age: ${(ageState.toString())}',
      style: Theme.of(context).textTheme.headline6,
    ).padding(horizontal: 10).alignment(Alignment.center);
  }
}
