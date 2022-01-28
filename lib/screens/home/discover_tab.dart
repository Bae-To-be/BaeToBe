import 'package:flutter/material.dart';

class DiscoverTab extends StatelessWidget {
  const DiscoverTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('discover', style: Theme.of(context).textTheme.headline3));
  }
}
