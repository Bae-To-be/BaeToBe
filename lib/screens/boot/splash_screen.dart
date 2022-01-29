import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Directionality(
              textDirection: TextDirection.ltr,
              child: LinearProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.white,
              )),
          Image(
            image: AssetImage('assets/splash_logo/splash.png'),
          ),
          Directionality(
              textDirection: TextDirection.ltr,
              child: LinearProgressIndicator(
                color: Color(0xFF00838C),
                backgroundColor: Color(0xFFCCECEE),
              ))
        ],
      ),
    );
  }
}
