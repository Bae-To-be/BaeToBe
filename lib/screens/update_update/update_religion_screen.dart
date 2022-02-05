import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/forms/select_tile.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/religion_provider.dart';
import 'package:baetobe/domain/form_states/religion_state_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UpdateReligionScreen extends HookConsumerWidget {
  const UpdateReligionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final religionListing = ref.watch(religionProvider);
    final state = ref.watch(religionStateProvider);

    void onSubmit() {
      ref
          .read(userProvider.notifier)
          .updateAttributes({'religion_id': state}, routeTo: AppLinks.back);
    }

    return FormLayout(
        header: const CustomHeaderTile(text: Headings.religion),
        children: <Widget>[
          religionListing
              .maybeWhen(
                  data: (listing) => ListView.builder(
                      itemCount: listing.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        bool isSelected = state == listing[index].id;

                        return SelectTile(
                            title: listing[index].name,
                            selected: isSelected,
                            onTap: () => ref
                                .read(religionStateProvider.notifier)
                                .state = listing[index].id);
                      }),
                  orElse: () => Center(
                      child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor)))
              .padding(top: 36),
        ],
        floatingSubmit: FloatingCta(
          enabled: state != null,
          onPressed: onSubmit,
        ));
  }
}
