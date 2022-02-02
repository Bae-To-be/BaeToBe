import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshFooter extends StatelessWidget {
  const RefreshFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = const Text('pull up to load older');
        } else if (mode == LoadStatus.loading) {
          body = SizedBox(
            width: 25.0,
            height: 25.0,
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor),
          );
        } else if (mode == LoadStatus.failed) {
          body = const Text('Load Failed! Click retry!');
        } else if (mode == LoadStatus.canLoading) {
          body = const Text('release to load more');
        } else {
          body = const Text('No more Data');
        }
        return SizedBox(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}
