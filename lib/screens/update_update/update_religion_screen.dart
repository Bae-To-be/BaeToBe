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

  List<Widget> _tiles(BuildContext context, List religionListing, int? selected,
      void Function(int value) onTap, void Function() onSubmit) {
    List<Widget> result = [];

    for (var religion in religionListing) {
      bool isSelected = selected == religion.id;

      result.add(SelectTile(
          title: religion.name,
          selected: isSelected,
          onTap: () => onTap(religion.id)));
    }
    return result;
  }

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
          religionListing.maybeWhen(
              data: (listing) => Column(
                    children: _tiles(context, listing, state, (int value) {
                      ref.read(religionStateProvider.notifier).state = value;
                    }, onSubmit),
                  ).padding(top: 36),
              orElse: () => Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor))),
        ],
        floatingSubmit: FloatingCta(
          enabled: state != null,
          onPressed: onSubmit,
        ));
  }
}