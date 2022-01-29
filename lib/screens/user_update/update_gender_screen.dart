import 'package:baetobe/application/page_wrapper.dart';
import 'package:baetobe/components/bottomsheet_utils.dart';
import 'package:baetobe/components/buttons/custom_text_button.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/forms/selet_tile.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/gender_provider.dart';
import 'package:baetobe/domain/search_query_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/gender.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

final _searchResults = StateProvider.autoDispose<List<Gender>>((ref) {
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
  return results.whereNot((gender) => gender.name == 'All').toList();
});

final _selected = StateProvider.autoDispose<int?>((ref) {
  int? result;
  final user = ref.watch(userProvider);
  final genders = ref.watch(genderProvider);
  if (user.value?.gender != null) {
    genders.whenData((listing) {
      final match = listing.allGenders
          .firstWhereOrNull((gender) => gender.name == user.value!.gender);
      if (match != null) {
        result = match.id;
      }
    });
  }
  return result;
});

class UpdateGenderScreen extends HookConsumerWidget {
  const UpdateGenderScreen({Key? key}) : super(key: key);

  List<Widget> _tiles(BuildContext context, GenderListing genderListing,
      int? selected, void Function(int value) onTap) {
    List<Widget> result = [];

    bool defaultSelected = false;

    for (var gender in genderListing.defaultGenders) {
      bool isSelected = selected != null && selected == gender.id;

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

    if (selected != null && !defaultSelected) {
      Gender selection = genderListing.allGenders
          .firstWhere((gender) => gender.id == selected);

      result.add(SelectTile(
          title: selection.name,
          selected: true,
          onTap: () => onTap(selection.id)));
    }

    result.add(_ViewMoreGenders());
    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genderListing = ref.watch(genderProvider);
    final state = ref.watch(_selected);
    final user = ref.watch(userProvider);

    return PageWrapper(
        child: FormLayout(
            children: <Widget>[
          const Heading5(text: Headings.enterGender)
              .padding(top: 32, bottom: 36),
          genderListing.maybeWhen(
              data: (GenderListing listing) => Column(
                    children: _tiles(context, listing, state, (int value) {
                      ref.read(_selected.notifier).state = value;
                    }),
                  ),
              orElse: () => Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor))),
        ],
            floatingSubmit: FloatingCta(
              color:
                  state != null ? Theme.of(context).primaryColor : Colors.grey,
              loading: user is AsyncLoading,
              onPressed: () {
                if (state == null) {
                  return;
                }
                ref.read(userProvider.notifier).updateAttributes(
                    {'gender_id': state},
                    routeTo: AppLinks.updateInterestedGenders);
              },
            )));
  }
}

class _ViewMoreGenders extends HookConsumerWidget {
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
                const BottomSheetHeader(text: Headings.gender),
                const SearchField(),
                Expanded(
                  child: Consumer(builder: (context, ref, child) {
                    final state = ref.watch(_selected);
                    final results = ref.watch(_searchResults);

                    return ListView.builder(
                        itemCount: results.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SelectTile(
                            title: results[index].name,
                            selected: state == results[index].id,
                            onTap: () => ref.read(_selected.notifier).state =
                                results[index].id,
                          );
                        });
                  }),
                ),
                Consumer(builder: (context, ref, child) {
                  final state = ref.watch(_selected);
                  final user = ref.watch(userProvider);

                  return CustomTextButton(
                      text: LinkTexts.cont,
                      loading: user is AsyncLoading,
                      onPressed: () {
                        if (state == null) {
                          return;
                        }
                        ref.read(userProvider.notifier).updateAttributes(
                            {'gender_id': state},
                            routeTo: AppLinks.updateInterestedGenders);
                      });
                }),
              ],
            );
          },
        );
      },
    );
  }
}
