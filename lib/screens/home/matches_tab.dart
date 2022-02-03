import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/components/custom_divider.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/refresh_footer.dart';
import 'package:baetobe/components/refresh_header.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/matches_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:styled_widget/styled_widget.dart';

class MatchesTab extends HookConsumerWidget {
  final RefreshController controller = RefreshController();
  MatchesTab({Key? key}) : super(key: key);

  Widget _retryView(String text, BuildContext context, WidgetRef ref) {
    return Center(
        child: TextButton(
            style:
                TextButton.styleFrom(primary: Theme.of(context).primaryColor),
            onPressed: () =>
                ref.read(matchesProvider.notifier).fetchMatches(1, true),
            child: Text(text)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matches = ref.watch(matchesProvider);
    return Column(
      children: [
        const CustomHeaderTile(
          text: Headings.matches,
          withCross: false,
        ),
        matches.when(
          loading: () => Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor)),
          data: (matchesListing) {
            if (matchesListing.isEmpty) {
              return _retryView(ErrorMessages.noLikesFound, context, ref);
            }

            return Expanded(
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: const RefreshHeader(text: InfoLabels.matchesLoaded),
                footer: const RefreshFooter(),
                onLoading: () {
                  ref
                      .read(matchesProvider.notifier)
                      .fetchMatches(null, false)
                      .then((gotData) {
                    if (gotData) {
                      controller.loadComplete();
                    } else {
                      controller.loadNoData();
                    }
                  });
                },
                controller: controller,
                onRefresh: () {
                  ref
                      .read(matchesProvider.notifier)
                      .fetchMatches(1, false)
                      .then((_) {
                    controller.refreshCompleted();
                    controller.resetNoData();
                  });
                },
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const CustomDivider(),
                  itemBuilder: (c, i) => GFListTile(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    icon: Row(children: [
                      if (matchesListing[i].hasUnread())
                        GFBadge(
                            color: Theme.of(context).primaryColor,
                            child:
                                Text(matchesListing[i].unreadCount.toString()),
                            shape: GFBadgeShape.pills)
                      else
                        Container(),
                      CustomTextWidget(
                          type: textWidgetType.caption,
                          text: matchesListing[i].timeSinceUpdate)
                    ]),
                    avatar: GFAvatar(
                      shape: GFAvatarShape.circle,
                      backgroundColor: offWhite,
                      backgroundImage: matchesListing[i].profilePicture != null
                          ? CachedNetworkImageProvider(
                              matchesListing[i].profilePicture!.url)
                          : Image.asset('assets/profile_placeholder.png').image,
                    ),
                    color: offWhite,
                    title: Text(matchesListing[i].userName,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontWeight: FontWeight.w500)),
                    onTap: () {
                      ref.read(routerProvider.notifier).pushNamed(
                          AppLinks.profileDetails(matchesListing[i].userId));
                    },
                  ),
                  itemCount: matchesListing.length,
                ),
              ).padding(bottom: 10),
            );
          },
          error: (_error, _) => _retryView(
              ErrorMessages.somethingWentWrongTryAgain, context, ref),
        )
      ],
    );
  }
}
