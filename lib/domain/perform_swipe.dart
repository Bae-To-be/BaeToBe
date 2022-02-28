import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/likes_provider.dart';
import 'package:baetobe/domain/matches_provider.dart';
import 'package:baetobe/entities/data/like.dart';
import 'package:baetobe/entities/data/match.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> swipe(String direction, int id, WidgetRef ref,
    BuildContext context, Function() onSuccess) async {
  final client = ref.read(networkClientProvider);
  final error = ref.read(errorProvider.notifier);
  late final bool isMatchSuccess;

  await error.safelyExecute(
      command: client.post(BackendRoutes.swipe,
          data: {'direction': direction, 'user_id': id}),
      onError: (response) {},
      onSuccess: (response) async {
        isMatchSuccess = (response.data['data']['match'] != null);

        ref
            .read(likesProvider(LikeDirection.received).notifier)
            .removeLikeWithUser(id);

        await ref.read(routerProvider).pop();

        if (isMatchSuccess) {
          ref
              .read(matchesProvider.notifier)
              .addOrUpdateMatch(Match.fromJson(response.data['data']['match']));

          await showDialog(
            context: context,
            builder: (context) => HookConsumer(builder: (context, ref, child) {
              return AlertDialog(
                title: const Text(InfoLabels.itsAMatch),
                content: const Text(InfoLabels.matchDialogContent),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      ref.read(routerProvider.notifier).pop();
                    },
                    child: const Text(LinkTexts.maybeLater),
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(routerProvider).pop();
                      ref.read(routerProvider.notifier).push(
                          MessagesForMatchScreenRoute(
                              match: Match.fromJson(
                                  response.data['data']['match'])));
                    },
                    child: const Text(LinkTexts.startConversation),
                  ),
                ],
              );
            }),
          );
        }
        return Future.value(null);
      });
}
