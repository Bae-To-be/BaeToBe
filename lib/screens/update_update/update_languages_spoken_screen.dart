import 'package:auto_route/annotations.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/forms/select_tile.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/language_provider.dart';
import 'package:baetobe/domain/form_states/language_state_provider.dart';
import 'package:baetobe/domain/search_query_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

final _searchResults = StateProvider.autoDispose<List>((ref) {
  List results = [];
  final languages = ref.watch(languageProvider);
  final query = ref.watch(searchQueryProvider);
  languages.whenData((listing) {
    if (query.isEmpty) {
      results = listing;
    } else {
      results = listing
          .where((language) =>
              language.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  });
  return results;
});

class UpdateLanguagesSpokenScreen extends HookConsumerWidget {
  final bool? redirectBack;

  const UpdateLanguagesSpokenScreen(
      {Key? key, @QueryParam('redirectBack') this.redirectBack})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(languageStateProvider);
    final results = ref.watch(_searchResults);

    void onSubmit() {
      ref
          .read(userProvider.notifier)
          .updateAttributes({'language_ids': state}, routeTo: AppLinks.back);
    }

    Widget list(results) {
      if (results.isNotEmpty) {
        return Expanded(
          child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (BuildContext context, int index) {
                return SelectTile(
                  title: results[index].name,
                  selected: state.contains(results[index].id),
                  onTap: () {
                    if (state.contains(results[index].id)) {
                      ref.read(languageStateProvider.notifier).state =
                          state.where((id) => id != results[index].id).toList();
                      return;
                    }
                    ref.read(languageStateProvider.notifier).state = [
                      ...state,
                      (results[index].id)
                    ];
                  },
                ).padding(horizontal: 10);
              }),
        );
      } else {
        return Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor))
            .padding(top: 16);
      }
    }

    return FormLayout(
        header: const CustomHeaderTile(
          text: Headings.language,
          headerWith: HeaderWith.chevron,
        ),
        children: <Widget>[const SearchField(), list(results)],
        floatingSubmit: FloatingCta(
          icon: FontAwesomeIcons.solidSave,
          enabled: state.isNotEmpty,
          onPressed: onSubmit,
        ));
  }
}
