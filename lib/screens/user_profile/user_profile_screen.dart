import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/components/buttons/custom_text_button.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/profile_details_provider.dart';
import 'package:baetobe/entities/data/detailed_profile.dart';
import 'package:baetobe/entities/data/user_education.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UserProfileScreen extends HookConsumerWidget {
  final int id;
  final int? age;
  final String? name;
  final String? firstPhotoUrl;

  String cmToFeetAndInchesAndCmString(int heightInCm) {
    int heightInInches = (heightInCm / 2.54).round();
    int feet = (heightInInches / 12).floor();
    int inches = (heightInInches - (12 * feet)).floor();

    return '$feet\' $inches" ($heightInCm cm)';
  }

  const UserProfileScreen(
      {Key? key,
      @PathParam('id') required this.id,
      this.age,
      this.name,
      this.firstPhotoUrl})
      : super(key: key);

  List<Widget> list(
    context,
    String workTitle,
    String industry,
    List<UserEducation> education,
  ) {
    List<ListTile> result = [];

    result.add(ListTile(
      leading: const Icon(
        FontAwesomeIcons.briefcase,
        color: themeColor,
      ),
      horizontalTitleGap: 0,
      title: Text('$workTitle, $industry',
          style: const TextStyle(
            fontSize: 14,
          )),
    ));

    for (var e in education) {
      result.add(ListTile(
        leading: const Icon(
          FontAwesomeIcons.graduationCap,
          color: themeColor,
        ),
        horizontalTitleGap: 0,
        title: Text('${e.courseName} from ${e.universityName} in ${e.year}',
            style: const TextStyle(
              fontSize: 14,
            )),
      ));
    }

    return result;
  }

  List<Widget> actions(
    BuildContext context,
    bool isMatchClosed,
    bool isReported,
    WidgetRef ref,
    DetailedProfile profile,
  ) {
    List<Widget> result = [];

    if (!isReported) {
      result.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextButton(
              onPressed: () => ref
                  .read(routerProvider.notifier)
                  .push(ReportUserScreenRoute(profile: profile)),
              text: LinkTexts.reportUser,
              type: textWidgetType.caption),
        ],
      ));
    }

    if (profile.match == null) {
      return result;
    }

    result.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextButton(
            onPressed: () {
              ref
                  .read(routerProvider.notifier)
                  .navigate(MessagesForMatchScreenRoute(match: profile.match!));
            },
            text: LinkTexts.conversation,
            type: textWidgetType.caption),
      ],
    ));

    if (!isMatchClosed) {
      result.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(InfoLabels.warning),
                          content: const Text(InfoLabels.closeMatchInfo),
                          actions: [
                            TextButton(
                              child: const Text(LinkTexts.cancel),
                              onPressed: () {
                                ref.read(routerProvider.notifier).pop();
                              },
                            ),
                            TextButton(
                              child: const Text(LinkTexts.cont),
                              onPressed: () =>
                                  closeMatch(profile.match!.id, ref),
                            ),
                          ],
                        ));
              },
              type: textWidgetType.caption,
              text: 'Unmatch'),
        ],
      ));
    }

    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRequest = ref.watch(profileDetailsProvider(id));
    final isReported = ref.watch(isReportedProvider(id));
    final isMatchClosed = ref.watch(isProfileMatchClosedProvider(id));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CustomHeaderTile(text: '', headerWith: HeaderWith.chevron),
            (firstPhotoUrl != null)
                ? Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                            tag: id,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  child: (firstPhotoUrl !=
                                          'assets/profile_placeholder.png')
                                      ? CachedNetworkImage(
                                          fit: BoxFit.fitWidth,
                                          alignment: Alignment.topCenter,
                                          imageUrl: firstPhotoUrl!,
                                          cacheKey: firstPhotoUrl,
                                          placeholderFadeInDuration:
                                              const Duration(milliseconds: 500),
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Center(
                                            child: CircularProgressIndicator(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                value:
                                                    downloadProgress.progress),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        )
                                      : Image.asset(
                                          'assets/profile_placeholder.png'),
                                ),
                              ),
                            )),
                        Hero(
                            tag: name!,
                            child: Text(
                              '$name, $age',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: themeColor),
                            ).padding(all: 24)),
                      ],
                    ))
                : Container(),
            profileRequest.maybeWhen(
                orElse: () => Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor)),
                data: (profile) {
                  if (profile == null) {
                    return const Center(
                        child: CustomTextWidget(
                      type: textWidgetType.heading5,
                      text: ErrorMessages.userNotFound,
                      withRow: false,
                    ));
                  }

                  return Column(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(profile.bio!)
                            .padding(horizontal: 16, top: 16, bottom: 24),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Wrap(
                            children: [
                              CustomChipWidget(
                                profile.gender,
                                avatar: const Icon(
                                  FontAwesomeIcons.solidUser,
                                  size: 16,
                                ),
                              ),
                              if (profile.hometown.cityName != '' ||
                                  profile.hometown.countryName != '')
                                CustomChipWidget(
                                  (profile.hometown.cityName != '' ||
                                          profile.hometown.countryName != '')
                                      ? '${profile.hometown.cityName}, ${profile.hometown.countryName}'
                                      : '${profile.hometown.cityName}${profile.hometown.countryName}',
                                  avatar: const Icon(
                                    FontAwesomeIcons.ruler,
                                    size: 16,
                                  ),
                                ),
                              if (profile.heightInCms != null)
                                CustomChipWidget(
                                  cmToFeetAndInchesAndCmString(
                                      profile.heightInCms!),
                                  avatar: const Icon(
                                    FontAwesomeIcons.ruler,
                                    size: 16,
                                  ),
                                ),
                              if (profile.food != null)
                                CustomChipWidget(
                                  profile.food!.name,
                                  avatar: const Icon(
                                    FontAwesomeIcons.solidUser,
                                    size: 16,
                                  ),
                                ),
                              if (profile.drinking != null)
                                CustomChipWidget(
                                  profile.drinking!.name,
                                  avatar: const Icon(
                                    FontAwesomeIcons.solidUser,
                                    size: 16,
                                  ),
                                ),
                              if (profile.smoking != null)
                                CustomChipWidget(
                                  profile.smoking!.name,
                                  avatar: const Icon(
                                    FontAwesomeIcons.solidUser,
                                    size: 16,
                                  ),
                                ),
                              if (profile.children != null)
                                CustomChipWidget(
                                  profile.children!.name,
                                  avatar: const Icon(
                                    FontAwesomeIcons.solidUser,
                                    size: 16,
                                  ),
                                ),
                              if (profile.exercise != null)
                                CustomChipWidget(
                                  profile.exercise!.name,
                                  avatar: const Icon(
                                    FontAwesomeIcons.solidUser,
                                    size: 16,
                                  ),
                                ),
                              if (profile.religion != null)
                                CustomChipWidget(
                                  profile.religion!.name,
                                  avatar: const Icon(
                                    FontAwesomeIcons.prayingHands,
                                    size: 16,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: ListTile.divideTiles(tiles: [
                                ...list(context, profile.workTitle,
                                    profile.industry, profile.education)
                              ], context: context)
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                    ),
                    ...profile.images.skip(1).map((e) {
                      return Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: CachedNetworkImage(
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                          imageUrl: e.url,
                          cacheKey: e.id.toString(),
                          placeholderFadeInDuration:
                              const Duration(milliseconds: 500),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                                value: downloadProgress.progress),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      );
                    }),
                    ...actions(context, isMatchClosed, isReported, ref, profile)
                    // ListView.builder(
                    //   itemBuilder: (context, index) {
                    //     if (index != 0) {
                    //       return CachedNetworkImage(
                    //         fit: BoxFit.fitWidth,
                    //         alignment: Alignment.topCenter,
                    //         imageUrl: profile.images[index].url,
                    //         cacheKey: profile.images[index].url,
                    //         placeholderFadeInDuration:
                    //             const Duration(milliseconds: 500),
                    //         progressIndicatorBuilder:
                    //             (context, url, downloadProgress) => Center(
                    //           child: CircularProgressIndicator(
                    //               color: Theme.of(context).primaryColor,
                    //               value: downloadProgress.progress),
                    //         ),
                    //         errorWidget: (context, url, error) =>
                    //             const Icon(Icons.error),
                    //       );
                    //     }
                    //   },
                    //   shrinkWrap: true,
                    // )
                    // Text(profile.toString()).padding(horizontal: 15),
                    // ...actions(context, isMatchClosed, isReported, ref, profile)
                  ]);
                })
          ],
        ),
      ),
    );
  }
}

class CustomChipWidget extends StatelessWidget {
  final String label;
  final Widget avatar;

  const CustomChipWidget(this.label, {Key? key, required this.avatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Chip(
        label: Text(label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        avatar: avatar,
        backgroundColor: chipColor,
      ),
    );
  }
}
