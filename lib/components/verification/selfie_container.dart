import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/form_states/selfie_verification_state_provider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
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
        const Heading5(text: InfoLabels.loadingCamera),
        CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ).padding(top: 20)
      ]).padding(horizontal: 15);
    }

    if (state.uploading) {
      return SelfieTile(
        child: SizedBox(
          width: width / state.controller!.value.aspectRatio,
          height: width,
          child: GFShimmer(
            child: Container(color: Colors.white),
          ),
        ),
      );
    }

    if (state.url != null) {
      return SelfieTile(
        child: SizedBox(
          width: width / state.controller!.value.aspectRatio,
          height: width,
          child: Image.network(
            state.url!,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: GFShimmer(
                  child: Container(color: Colors.white),
                ),
              );
            },
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
