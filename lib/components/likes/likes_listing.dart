import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/components/refresh_footer.dart';
import 'package:baetobe/components/refresh_header.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/likes_provider.dart';
import 'package:baetobe/entities/data/like.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  crossAxisCount: 2,
                  childAspectRatio: 0.7),
              itemCount: likesListing.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => ref.read(routerProvider.notifier).pushNamed(
                    AppLinks.profileDetails(likesListing[index].userId)),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _CardImage(
                              constraints: constraints,
                              likesListing: likesListing,
                              index: index),
                          SizedBox(
                            height: constraints.maxHeight * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  '${likesListing[index].userName.split(' ').first}, 24',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontWeight: FontWeight.w600),
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                ).padding(horizontal: 4),
                                Text(
                                  likesListing[index].summary,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontWeight: FontWeight.w300),
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                ).padding(horizontal: 4),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
      error: (_error, _) =>
          _retryView(ErrorMessages.somethingWentWrongTryAgain, context, ref),
    );
  }
}

class _CardImage extends StatelessWidget {
  final BoxConstraints constraints;
  final List<Like> likesListing;
  final int index;

  const _CardImage(
      {Key? key,
      required this.constraints,
      required this.likesListing,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.7,
      child: Stack(
        children: <Widget>[
          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: AspectRatio(
                aspectRatio:
                    constraints.maxWidth / (constraints.maxHeight * 0.7),
                child: (likesListing[index].profilePicture != null)
                    ? CachedNetworkImage(
                        fit: BoxFit.fitWidth,
                        imageUrl: likesListing[index].profilePicture!.url,
                        cacheKey:
                            likesListing[index].profilePicture!.id.toString(),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Image.asset('assets/profile_placeholder.png',
                        height: constraints.maxHeight * 0.73,
                        width: constraints.maxWidth),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
