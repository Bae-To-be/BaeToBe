import 'package:baetobe/components/bottomsheet_utils.dart';
import 'package:baetobe/components/buttons/custom_text_button.dart';
import 'package:baetobe/components/forms/select_tile.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/gender_provider.dart';
import 'package:baetobe/domain/search_query_provider.dart';
import 'package:baetobe/entities/generated/gender.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

final _searchResults =
    StateProvider.autoDispose.family<List<Gender>, bool>((ref, excludeAll) {
  List<Gender> results = [];
  final genders = ref.watch(genderProvider);
  final query = ref.watch(searchQueryProvider);
  genders.whenData((listing) {
    if (query.isEmpty) {
      results = listing.allGenders;
    } else {
      results = listing.allGenders
          .where((gender) =>
              gender.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  });
  if (excludeAll) {
    return results.whereNot((gender) => gender.name == 'All').toList();
  }
  return results;
});

class ViewMoreGenders extends HookConsumerWidget {
  final void Function() onSubmit;
  final void Function(int id) onSelect;
  final String heading;
  final AutoDisposeStateProvider<List<int>> selectionNotifier;
  final bool excludeAll;

  const ViewMoreGenders(
      {Key? key,
      required this.onSubmit,
      this.excludeAll = true,
      required this.heading,
      required this.selectionNotifier,
      required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SelectTile(
      title: LinkTexts.viewMore,
      selected: false,
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: bottomSheetShape(),
          backgroundColor: const Color(0xFFF2F2F2),
          builder: (BuildContext context) {
            return Column(
              children: [
                BottomSheetHeader(text: heading),
                const SearchField(),
                Expanded(
                  child: Consumer(builder: (context, ref, child) {
                    final results = ref.watch(_searchResults(excludeAll));
                    final selected = ref.watch(selectionNotifier);

                    return ListView.builder(
                        itemCount: results.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SelectTile(
                            title: results[index].name,
                            selected: selected.contains(results[index].id),
                            onTap: () => onSelect(results[index].id),
                          ).padding(horizontal: 10);
                        });
                  }),
                ),
                CustomTextButton(text: LinkTexts.cont, onPressed: onSubmit),
              ],
            );
          },
        );
      },
    );
  }
}
