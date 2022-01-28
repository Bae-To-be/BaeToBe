import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/page_wrapper.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageWrapper(child: AutoRouter());
  }
}
