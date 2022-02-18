import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/components/custom_cached_network_image.dart';
import 'package:baetobe/components/refresh_footer.dart';
import 'package:baetobe/components/refresh_header.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/likes_provider.dart';
import 'package:baetobe/entities/data/like.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:styled_widget/styled_widget.dart';

class LikesListing extends HookConsumerWidget {
  final LikeDirection direction;
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

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SmartRefresher(
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
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 7),
                itemCount: likesListing.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ref.read(routerProvider.notifier).push(
                            UserProfileScreenRoute(
                                id: likesListing[index].user.userId,
                                basicProfile: likesListing[index].user),
                          );
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _CardImage(likesListing: likesListing, index: index),
                          Hero(
                            tag:
                                '${likesListing[index].user.userName}${likesListing[index].user.userId}',
                            child: Text(
                              '${likesListing[index].user.userName.split(' ').first}, ${likesListing[index].user.age}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 1.05),
                              textAlign: TextAlign.center,
                            ).padding(top: 12, horizontal: 8),
                          ),
                          Flexible(
                            child: Text(
                              likesListing[index].user.summary!,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  height: 1.2),
                              textAlign: TextAlign.center,
                              // softWrap: false,
                              overflow: TextOverflow.fade,
                            ).padding(top: 12, horizontal: 8),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );
      },
      error: (_error, _) =>
          _retryView(ErrorMessages.somethingWentWrongTryAgain, context, ref),
    );
  }
}

class _CardImage extends StatelessWidget {
  final List<Like> likesListing;
  final int index;

  const _CardImage({Key? key, required this.likesListing, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Hero(
              tag: likesListing[index].user.userId,
              child: AspectRatio(
                aspectRatio: ImageAspectRatio.ratioX / ImageAspectRatio.ratioY,
                child: Container(
                  child: (likesListing[index].user.profilePicture != null)
                      ? CustomCachedNetworkImage(
                          imageURL:
                              likesListing[index].user.profilePicture!.url,
                          cacheKey: likesListing[index]
                              .user
                              .profilePicture!
                              .url
                              .toString(),
                        )
                      : Image.asset('assets/profile_placeholder.png'),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 8,
            right: 8,
            child: Container(
              decoration: BoxDecoration(
                  color: themeColor, borderRadius: BorderRadius.circular(4)),
              child: Text(
                likesListing[index].timeSinceCreation,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ).padding(horizontal: 4, bottom: 4, top: 2),
            )),
      ],
    );
  }
}
