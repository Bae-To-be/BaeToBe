import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/components/custom_divider.dart';
import 'package:baetobe/components/refresh_footer.dart';
import 'package:baetobe/components/refresh_header.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/likes_provider.dart';
import 'package:baetobe/entities/like.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:styled_widget/styled_widget.dart';

class LikesListing extends HookConsumerWidget {
  final likeDirection direction;
  final RefreshController controller = RefreshController();

  LikesListing({Key? key, required this.direction}) : super(key: key);

  Widget _retryView(String text, BuildContext context, WidgetRef ref) {
    return Center(
        child: TextButton(
            style:
                TextButton.styleFrom(primary: Theme.of(context).primaryColor),
            onPressed: () =>
                ref.read(likesProvider(direction).notifier).fetchLikes(1, true),
            child: Text(text)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likes = ref.watch(likesProvider(direction));
    return likes.when(
      loading: () => Center(
          child:
              CircularProgressIndicator(color: Theme.of(context).primaryColor)),
      data: (likesListing) {
        if (likesListing.isEmpty) {
          return _retryView(ErrorMessages.noLikesFound, context, ref);
        }

        return SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: const RefreshHeader(text: InfoLabels.likesLoaded),
          footer: const RefreshFooter(),
          onLoading: () {
            ref
                .read(likesProvider(direction).notifier)
                .fetchLikes(null, false)
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
                .read(likesProvider(direction).notifier)
                .fetchLikes(1, false)
                .then((_) {
              controller.refreshCompleted();
              controller.resetNoData();
            });
          },
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const CustomDivider(),
            itemBuilder: (c, i) => GFListTile(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                avatar: GFAvatar(
                  shape: GFAvatarShape.circle,
                  backgroundColor: offWhite,
                  backgroundImage: likesListing[i].profilePicture != null
                      ? CachedNetworkImageProvider(
                          likesListing[i].profilePicture!.url)
                      : Image.asset('assets/profile_placeholder.png').image,
                ),
                color: offWhite,
                subTitle: Text(likesListing[i].summary,
                    style: Theme.of(context).textTheme.caption),
                title: Text(likesListing[i].userName,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontWeight: FontWeight.w500)),
                onTap: () {
                  ref.read(routerProvider.notifier).pushNamed(
                      AppLinks.profileDetails(likesListing[i].userId));
                },
                icon: CustomTextWidget(
                    type: textWidgetType.caption,
                    withRow: false,
                    text: likesListing[i].timeSinceCreation)),
            itemCount: likesListing.length,
          ),
        ).padding(bottom: 10, horizontal: 5);
      },
      error: (_error, _) =>
          _retryView(ErrorMessages.somethingWentWrongTryAgain, context, ref),
    );
  }
}
