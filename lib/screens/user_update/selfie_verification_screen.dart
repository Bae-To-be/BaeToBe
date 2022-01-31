import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelfieVerificationScreen extends HookConsumerWidget {
  const SelfieVerificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(child: Text('selfie screen'));
  }
}
