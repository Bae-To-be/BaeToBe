// import 'package:baetobe/domain/preferences_form_state.dart';
// import 'package:baetobe/presentation/components/custom_divider.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:styled_widget/styled_widget.dart';

class UpdatePreferences extends HookConsumerWidget {
  const UpdatePreferences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text('Update Preferences page'),
    );
    // return Obx(() {
    //   return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //     GFListTile(
    //         padding: const EdgeInsets.all(0),
    //         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    //         title: Text('Preferences',
    //             style: Theme.of(context).textTheme.headline5),
    //         icon: IconButton(
    //           icon: Icon(FontAwesomeIcons.solidTimesCircle,
    //               color: Theme.of(context).primaryColor, size: 20),
    //           onPressed: () => Get.back(),
    //         )),
    //     const CustomDivider(),
    //     Text('Distance (${_state.currentRadius()} Kms)',
    //         style: Theme.of(context)
    //             .textTheme
    //             .subtitle1!
    //             .copyWith(fontWeight: FontWeight.bold))
    //         .padding(top: 20, left: 20),
    //     Slider(
    //       value: _state.currentRadius(),
    //       min: 0,
    //       max: 50,
    //       divisions: 100,
    //       onChanged: _state.updateSearchRadius,
    //     ),
    //     Text('Age  (${_state.interestedInAgeLower.value} - ${_state.interestedInAgeUpper.value} years)',
    //         style: Theme.of(context)
    //             .textTheme
    //             .subtitle1!
    //             .copyWith(fontWeight: FontWeight.bold))
    //         .padding(top: 10, left: 20),
    //     RangeSlider(
    //         min: 18,
    //         max: 70,
    //         values: RangeValues(_state.interestedInAgeLower.value.toDouble(),
    //             _state.interestedInAgeUpper.value.toDouble()),
    //         onChanged: _state.updateAgeRange)
    //   ]);
    // });
  }
}
