import 'package:baetobe/application/theme.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/infrastructure/alice_provider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageWrapper extends HookConsumerWidget {
  final Widget child;
  const PageWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<String?>(errorProvider, (String? _, String? errorMessage) {
      if (errorMessage != null) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(errorMessage),
          ));

          Future.delayed(const Duration(seconds: 1),
              () => ref.read(errorProvider.notifier).updateError(null));
        });
      }
    });

    return Scaffold(
      backgroundColor: offWhite,
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar:
          FirebaseRemoteConfig.instance.getBool(RemoteConfigs.debugNavEnabled)
              ? const DebugNav()
              : null,
    );
  }
}

class DebugNav extends HookConsumerWidget {
  const DebugNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alice = ref.read(aliceProvider);

    return Container(
      height: 40,
      color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(FontAwesomeIcons.bug),
          TextButton(
            child: const Text(
              'network requests',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              alice.showInspector();
            },
          ),
        ],
      ),
    );
  }
}
