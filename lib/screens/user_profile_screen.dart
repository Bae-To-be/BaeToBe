import 'package:auto_route/auto_route.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/domain/profile_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UserProfileScreen extends HookConsumerWidget {
  final int id;

  const UserProfileScreen({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRequest = ref.watch(profileDetailsProvider(id));

    return profileRequest.maybeWhen(
        orElse: () => Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor)),
        data: (profile) {
          if (profile == null) {
            return const Center(
                child: Heading5(text: ErrorMessages.userNotFound));
          }

          return Column(
            children: [
              CustomHeaderTile(text: profile.name),
              Expanded(
                  child: SingleChildScrollView(
                      child: Text(profile.toString()).padding(horizontal: 15)))
            ],
          );
        });
  }
}
