import 'package:baetobe/application/page_wrapper.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageWrapper(child: Center(child: Text('profiles')));
  }
}
