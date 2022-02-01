import 'package:baetobe/domain/error_provider.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: child,
      ),
    );
  }
}
