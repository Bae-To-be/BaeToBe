import 'package:auto_route/annotations.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/forms/select_tile.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/language_provider.dart';
import 'package:baetobe/domain/form_states/language_state_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UpdateLanguagesSpokenScreen extends HookConsumerWidget {
  final bool? redirectBack;

  const UpdateLanguagesSpokenScreen(
      {Key? key, @QueryParam('redirectBack') this.redirectBack})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageListing = ref.watch(languageProvider);
    final state = ref.watch(languageStateProvider);

    void onSubmit() {
      ref
          .read(userProvider.notifier)
          .updateAttributes({'language_ids': state}, routeTo: AppLinks.back);
    }

    return FormLayout(
        header: const CustomHeaderTile(
          text: Headings.language,
          headerWith: HeaderWith.chevron,
        ),
        children: <Widget>[
          languageListing
              .maybeWhen(
                  data: (listing) => ListView.builder(
                      itemCount: listing.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        bool isSelected = state.contains(listing[index].id);

                        final currentState =
                            ref.read(languageStateProvider.notifier).state;

                        return SelectTile(
                            title: listing[index].name,
                            selected: isSelected,
                            onTap: () {
                              if (currentState.contains(listing[index].id)) {
                                ref.read(languageStateProvider.notifier).state =
                                    currentState
                                        .where((id) => id != listing[index].id)
                                        .toList();
                                return;
                              }
                              ref.read(languageStateProvider.notifier).state = [
                                ...currentState,
                                (listing[index].id)
                              ];
                            });
                      }),
                  orElse: () => Center(
                      child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor)))
              .padding(top: 36),
        ],
        floatingSubmit: FloatingCta(
          enabled: state.isNotEmpty,
          onPressed: onSubmit,
        ));
  }
}
