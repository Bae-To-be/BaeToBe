import 'package:baetobe/domain/error_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;
  const PageWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Stack(
          children: [child, const ErrorConsumer()],
        ),
      ),
    );
  }
}

class ErrorConsumer extends HookConsumerWidget {
  const ErrorConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorMessage = ref.watch(errorProvider);

    if (errorMessage != null) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
        ));

        Future.delayed(const Duration(seconds: 1),
            () => ref.read(errorProvider.notifier).updateError(null));
      });
    }
    return Container();
  }
}
