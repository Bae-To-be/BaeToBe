import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/infrastructure/alice_provider.dart';
import 'package:debug_friend/debug_friend.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DebugDrawerWrapper extends HookConsumerWidget {
  final Widget child;
  const DebugDrawerWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (Overlay.of(context) == null) {
      return child;
    }

    if (!FirebaseRemoteConfig.instance.getBool(RemoteConfigs.debugNavEnabled)) {
      return child;
    }

    return DebugFriendView(
        enabled: true,
        customActions: [
          ActionCard(
            icon: const Icon(FontAwesomeIcons.wifi),
            title: 'Network Requests',
            onTap: () => ref.read(aliceProvider).showInspector(),
          ),
        ],
        builder: (context) {
          return child;
        });
  }
}
