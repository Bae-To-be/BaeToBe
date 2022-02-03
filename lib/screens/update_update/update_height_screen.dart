import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/domain/form_states/height_state_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UpdateHeightScreen extends HookConsumerWidget {
  const UpdateHeightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedHeight = ref.watch(selectedHeightProvider);
    const heightLowerBound = 4;

    void onSubmit() {
      ref.read(userProvider.notifier).updateAttributes({
        'height_in_cms':
            ((selectedHeight + (heightLowerBound * 12)) * 2.54).round()
      }, routeTo: AppLinks.back);
    }

    return FormLayout(children: [
      const CustomHeaderTile(text: 'Height'),
      Expanded(flex: 1, child: Container()),
      _HeightInput(),
      Expanded(flex: 2, child: Container()),
    ], floatingSubmit: FloatingCta(onPressed: onSubmit));
  }
}

class _HeightInput extends HookConsumerWidget {
  // final heightLowerBound =
  //     FirebaseRemoteConfig.instance.getInt(RemoteConfigs.heightLowerBound);
  // final heightUpperBound =
  //     FirebaseRemoteConfig.instance.getInt(RemoteConfigs.heightUpperBound);
  final heightLowerBound = 4;
  final heightUpperBound = 7;
  final FixedExtentScrollController heightController =
      FixedExtentScrollController();

  _HeightInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedHeight = ref.watch(selectedHeightProvider);
    final height = ref.read(heightStateProvider);

    //TODO: FIX WHEEL NOT SCROLLING WHEN USING THIS CODE
    // useEffect(() {
    //   Future.microtask(() {
    //     WidgetsBinding.instance?.addPostFrameCallback((_) {
    //       if (height != null) {
    //         heightController
    //             .jumpToItem((height / 2.54).round() - (heightLowerBound * 12));
    //       } else {
    //         heightController.jumpToItem(12);
    //       }
    //     });
    //   });
    // });

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(alignment: Alignment.center, children: [
          Container(
            width: MediaQuery.of(context).size.width - 32,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          SizedBox(
            height: 250,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 40,
              physics: const FixedExtentScrollPhysics(),
              magnification: 1.25,
              useMagnifier: true,
              controller: heightController,
              onSelectedItemChanged: (index) {
                ref.read(selectedHeightProvider.state).update((state) => index);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount:
                    ((heightUpperBound * 12) - (heightLowerBound * 12)) + 1,
                builder: (BuildContext context, int index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    child: Text(
                      '${(((heightLowerBound * 12) + index) / 12).floor()}\' '
                      '${((heightLowerBound * 12) + index) % 12}" '
                      '(${(((heightLowerBound * 12) + index) * 2.54).round()} '
                      'cms)',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: (selectedHeight == index)
                              ? FontWeight.w600
                              : FontWeight.w300,
                          color: (selectedHeight == index)
                              ? Theme.of(context).primaryColor
                              : Colors.grey),
                    ).center(),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width - 32,
          )
              .alignment(Alignment.topCenter)
              .backgroundBlur(1)
              .clipRect()
              .positioned(top: 0),
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width - 32,
          )
              .alignment(Alignment.bottomCenter)
              .backgroundBlur(1)
              .clipRect()
              .positioned(bottom: 0),
        ]);
      },
    );
  }
}
