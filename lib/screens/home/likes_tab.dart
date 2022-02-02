import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LikesTab extends HookConsumerWidget {
  const LikesTab({Key? key}) : super(key: key);

  TextStyle tabTextStyleFor(bool selected, BuildContext context) {
    if (selected) {
      return Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(
            fontWeight: FontWeight.bold,
          )
          .underlined(distance: 2);
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
                title: const Heading4(text: Headings.likes),
                bottom: PreferredSize(
                  preferredSize: Size(
                    MediaQuery.of(context).size.width,
                    tabBarHeight,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: tabBarHeight,
                          width: MediaQuery.of(context).size.width / 2,
                          child: GestureDetector(
                            onTap: () => tabRouter.setActiveIndex(0),
                            child: Center(
                                child: GenericTextWidget(
                              textStyle: tabTextStyleFor(
                                  tabRouter.activeIndex == 0, context),
                              text: Headings.received,
                              withRow: false,
                            )),
                          ),
                        ),
                        SizedBox(
                          height: tabBarHeight,
                          width: MediaQuery.of(context).size.width / 2,
                          child: GestureDetector(
                            onTap: () => tabRouter.setActiveIndex(1),
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
                  ),
                )),
            body: child);
      },
    );
  }
}
