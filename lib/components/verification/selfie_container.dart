import 'dart:io';

import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/entities/view_models/selfie_state.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class SelfieContainer extends StatelessWidget {
  final SelfieState state;

  const SelfieContainer({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    if (state.controller == null ||
        state.controller?.value.isInitialized != true) {
      return Column(children: [
        const CustomTextWidget(
            type: TextWidgetType.heading5, text: InfoLabels.loadingCamera),
        CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ).padding(top: 20)
      ]).padding(horizontal: 15);
    }

    if (state.file != null) {
      return SelfieTile(
        child: SizedBox(
          width: width / state.controller!.value.aspectRatio,
          height: width,
          child: Image.file(
            File(state.file!.path),
          ),
        ),
      );
    }

    return SelfieTile(
      child: SizedBox(
        width: width / state.controller!.value.aspectRatio,
        height: width,
        child: CameraPreview(state.controller!),
      ),
    );
  }
}

class SelfieTile extends StatelessWidget {
  final Widget child;

  const SelfieTile({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width -
        32; //-32 is for 16 unit horizontal symmetric padding on the column
    return SizedBox(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(size / 2)),
        child: OverflowBox(
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: child,
          ),
        ),
      ),
    );
  }
}
