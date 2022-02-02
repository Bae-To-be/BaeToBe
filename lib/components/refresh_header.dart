import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:styled_widget/styled_widget.dart';

class RefreshHeader extends StatelessWidget {
  final String text;

  const RefreshHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WaterDropHeader(
      refresh: SizedBox(
        width: 25.0,
        height: 25.0,
        child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
      ),
      complete: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.done,
            color: Colors.grey,
          ).padding(right: 5),
          Text(
            text,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
