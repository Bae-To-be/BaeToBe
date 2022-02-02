import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/components/custom_divider.dart';
import 'package:baetobe/components/refresh_footer.dart';
import 'package:baetobe/components/refresh_header.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/domain/likes_provider.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:baetobe/entities/like.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:styled_widget/styled_widget.dart';

class LikesListing extends HookConsumerWidget {
  final likeDirection direction;
  final RefreshController controller = RefreshController();

  LikesListing({Key? key, required this.direction}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(loadingProvider);
    final likes = ref.watch(likesProvider(direction));
    if (loading) {
      return Center(
          child:
              CircularProgressIndicator(color: Theme.of(context).primaryColor));
    }
    if (likes.isEmpty) {
      return Center(
          child: TextButton(
              style:
                  TextButton.styleFrom(primary: Theme.of(context).primaryColor),
              onPressed: () => ref
                  .read(likesProvider(direction).notifier)
                  .fetchLikes(1, true),
              child: const Text('No likes found! Try again?')));
    }
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: const RefreshHeader(text: 'likes loaded'),
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
            .then((_) => controller.refreshCompleted());
      },
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            const CustomDivider(),
        itemBuilder: (c, i) => GFListTile(
            avatar: GFAvatar(
              shape: GFAvatarShape.circle,
              backgroundColor: offWhite,
              backgroundImage: likes[i].profilePicture != null
                  ? CachedNetworkImageProvider(likes[i].profilePicture!.url)
                  : Image.asset('assets/profile_placeholder.png').image,
            ),
            color: offWhite,
            subTitle: Text(likes[i].timeSinceCreation,
                style: Theme.of(context).textTheme.caption),
            title: Text(likes[i].userName,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.w500)),
            icon: IconButton(
              icon: Icon(FontAwesomeIcons.chevronRight,
                  color: Theme.of(context).primaryColor),
              onPressed: () {
                ref
                    .read(routerProvider.notifier)
                    .pushNamed(AppLinks.profileDetails(id: likes[i].userId));
              },
            )),
        itemCount: likes.length,
      ),
    ).padding(bottom: 10);
  }
}
