import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LikesTab extends HookConsumerWidget {
  const LikesTab({Key? key}) : super(key: key);

  TextStyle tabTextStyleFor(bool selected, BuildContext context) {
    if (selected) {
      return Theme.of(context).textTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold,
          );
    }
    return Theme.of(context).textTheme.headline6!;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsRouter(
      routes: const [
        LikesReceivedTabRoute(),
        LikesSentTabRoute(),
      ],
      builder: (context, child, animation) {
        final tabRouter = AutoTabsRouter.of(context);
        final tabBarHeight = MediaQuery.of(context).size.height * 0.08;
        return Scaffold(
            backgroundColor: offWhite,
            appBar: AppBar(
                backgroundColor: offWhite,
                elevation: 0,
                title: const CustomTextWidget(
                    text: Headings.likes, type: TextWidgetType.heading5),
                bottom: PreferredSize(
                  preferredSize: Size(
                    MediaQuery.of(context).size.width,
                    tabBarHeight,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => tabRouter.setActiveIndex(0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: tabRouter.activeIndex == 0
                                  ? themeColorLight
                                  : offWhiteDark,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          height: tabBarHeight * 0.9,
                          width: (MediaQuery.of(context).size.width - 32) / 2,
                          child: Center(
                              child: GenericTextWidget(
                            textStyle: tabTextStyleFor(
                                tabRouter.activeIndex == 0, context),
                            text: Headings.received,
                            withRow: false,
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => tabRouter.setActiveIndex(1),
                        child: Container(
                          decoration: BoxDecoration(
                              color: tabRouter.activeIndex == 1
                                  ? themeColorLight
                                  : offWhiteDark,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          height: tabBarHeight * 0.9,
                          width: (MediaQuery.of(context).size.width - 32) / 2,
                          child: Center(
                              child: GenericTextWidget(
                            textStyle: tabTextStyleFor(
                                tabRouter.activeIndex == 1, context),
                            text: Headings.sent,
                            withRow: false,
                          )),
                        ),
                      ),
                    ],
                  ),
                )),
            body: SlideTransition(
                position: Tween<Offset>(
                        begin: Offset(
                            tabRouter.activeIndex == 0 ? -1.0 : 1.0, 0.0),
                        end: Offset.zero)
                    .animate(animation),
                child: FadeTransition(
                    opacity: animation,
                    child: GestureDetector(
                        onHorizontalDragEnd: (dragEndDetails) {
                          if ((dragEndDetails.primaryVelocity ?? 0) < 0) {
                            tabRouter.setActiveIndex(1);
                          } else if ((dragEndDetails.primaryVelocity ?? 0) >
                              0) {
                            tabRouter.setActiveIndex(0);
                          }
                        },
                        child: child))));
      },
    );
  }
}
