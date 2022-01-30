import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/forms/select_tile.dart';
import 'package:baetobe/components/gender/view_more_genders.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/gender_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/gender.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

final _selected = StateProvider.autoDispose<List<int>>((ref) {
  List<int> result = [];
  final user = ref.watch(userProvider);
  final genders = ref.watch(genderProvider);
  user.whenData((value) {
    if (value.interestedGenders.isNotEmpty) {
      genders.whenData((listing) {
        final matches = listing.allGenders
            .where((gender) => value.interestedGenders.contains(gender.name));
        result = matches.map((gender) => gender.id).toList();
      });
    }
  });

  return result;
});

class UpdateInterestedGenderScreen extends HookConsumerWidget {
  const UpdateInterestedGenderScreen({Key? key}) : super(key: key);

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
      selectionNotifier: _selected,
      heading: Headings.interestedIn,
    ));
    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genderListing = ref.watch(genderProvider);
    final state = ref.watch(_selected);
    final user = ref.watch(userProvider);

    void onSubmit() {
      if (state.isEmpty) {
        return;
      }
      ref.read(userProvider.notifier).updateAttributes(
          {'interested_gender_ids': state},
          routeTo: AppLinks.updateWorkDetails);
    }

    return FormLayout(
        children: <Widget>[
          const SizedBox(height: 32),
          const Heading5(text: Headings.enterInterestedGender)
              .padding(top: 32, bottom: 36, left: 10),
          genderListing.maybeWhen(
              data: (GenderListing listing) => ListView(
                    shrinkWrap: true,
                    children: _tiles(context, listing, state, (int value) {
                      final currentState = ref.read(_selected.notifier).state;
                      final allGenders = genderListing.value?.defaultGenders
                          .firstWhereOrNull((gender) => gender.name == 'All');
                      if (currentState.contains(value)) {
                        ref.read(_selected.notifier).state =
                            currentState.where((id) => id != value).toList();
                        return;
                      }
                      if (allGenders != null) {
                        if (currentState.contains(allGenders.id)) {
                          return;
                        }
                        if (value == allGenders.id) {
                          ref.read(_selected.notifier).state = [value];
                          return;
                        }
                      }
                      ref.read(_selected.notifier).state = [
                        ...currentState,
                        value
                      ];
                    }, onSubmit),
                  ),
              orElse: () => Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor))),
        ],
        floatingSubmit: FloatingCta(
          color:
              state.isNotEmpty ? Theme.of(context).primaryColor : Colors.grey,
          loading: user is AsyncLoading,
          onPressed: onSubmit,
        ));
  }
}