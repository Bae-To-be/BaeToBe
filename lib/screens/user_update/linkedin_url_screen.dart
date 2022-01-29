import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LinkedinUrlScreen extends HookConsumerWidget {
  const LinkedinUrlScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: Text('linkedin page'));
  }
}
