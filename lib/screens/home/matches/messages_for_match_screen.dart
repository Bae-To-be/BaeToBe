import 'dart:async';

import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/domain/matches_provider.dart';
import 'package:baetobe/entities/match.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessagesForMatchScreen extends HookConsumerWidget {
  final Match match;
  const MessagesForMatchScreen({Key? key, required this.match})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider.notifier);
    return WillPopScope(
      onWillPop: () async {
        unawaited(ref.read(matchesProvider.notifier).fetchMatches(1, false));
        return true;
      },
      child: Column(children: [
        GFListTile(
            icon: IconButton(
              icon: Icon(FontAwesomeIcons.solidTimesCircle,
                  color: Theme.of(context).primaryColor, size: 20),
              onPressed: () {
                ref.read(routerProvider.notifier).pop();
              },
            ),
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(0),
            avatar: GFAvatar(
              shape: GFAvatarShape.square,
              backgroundColor: Colors.white,
              size: GFSize.LARGE,
              backgroundImage: match.profilePicture != null
                  ? CachedNetworkImageProvider(match.profilePicture!.url)
                  : Image.asset('assets/profile_placeholder.png').image,
            ),
            onTap: () {
              router.pushNamed(AppLinks.profileDetails(match.userId));
            },
            title: Text(match.userName,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.w500))),
      ]),
    );
  }
}
