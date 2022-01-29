import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/forms/select_tile.dart';
import 'package:baetobe/components/gender/view_more_genders.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/gender_provider.dart';
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
    if (value.gender != null) {
      genders.whenData((listing) {
        final match = listing.allGenders
            .firstWhereOrNull((gender) => gender.name == value.gender);
        if (match != null) {
          result = [match.id];
        }
      });
    }
  });

  return result;
});

class UpdateGenderScreen extends HookConsumerWidget {
  const UpdateGenderScreen({Key? key}) : super(key: key);

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
      selectionNotifier: _selected,
      heading: Headings.gender,
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
          {'gender_id': state.first},
          routeTo: AppLinks.updateInterestedGenders);
    }

    return FormLayout(
        children: <Widget>[
          const Heading5(text: Headings.enterGender)
              .padding(top: 32, bottom: 36, left: 15),
          genderListing.maybeWhen(
              data: (GenderListing listing) => Column(
                    children: _tiles(context, listing, state, (int value) {
                      ref.read(_selected.notifier).state = [value];
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
