import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/helper_methods.dart';
import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/custom_cached_network_image.dart';
import 'package:baetobe/components/custom_card.dart';
import 'package:baetobe/components/custom_chip.dart';
import 'package:baetobe/components/custom_icons.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/profile_details_provider.dart';
import 'package:baetobe/entities/data/basic_profile.dart';
import 'package:baetobe/entities/data/detailed_profile.dart';
import 'package:baetobe/entities/data/user_education.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

enum ActionMenu { report, close, conversation }

class UserProfileScreen extends HookConsumerWidget {
  final int id;
  final BasicProfile basicProfile;
  final bool showCTA;

  const UserProfileScreen(
      {Key? key,
      @PathParam('id') required this.id,
      required this.basicProfile,
      this.showCTA = false})
      : super(key: key);

  List<Widget> workAndEducationList(
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
        title: Text(e.formatted(),
            style: const TextStyle(
              fontSize: 14,
            )),
      ));
    }

    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRequest = ref.watch(profileDetailsProvider(id));
    final isReported = ref.watch(isReportedProvider(id));
    final isMatchClosed = ref.watch(isProfileMatchClosedProvider(id));

    return Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              CustomCardWidget(
                  padding: EdgeInsets.zero,
                  content: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                              tag: id,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: AspectRatio(
                                  aspectRatio: ImageAspectRatio.ratioX /
                                      ImageAspectRatio.ratioY,
                                  child: Container(
                                    child: (basicProfile.profilePicture != null)
                                        ? CustomCachedNetworkImage(
                                            imageURL: basicProfile
                                                .profilePicture!.url,
                                            cacheKey: basicProfile
                                                .profilePicture!.id
                                                .toString())
                                        : Image.asset(
                                            'assets/profile_placeholder.png'),
                                  ),
                                ),
                              )),
                          Hero(
                              tag: '${basicProfile.userName}$id',
                              child: Text(
                                '${basicProfile.userName}, ${basicProfile.age}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: themeColor),
                              ).padding(all: 24)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              ref.read(routerProvider).pop();
                            },
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  shape: BoxShape.circle),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                child: Icon(
                                  FontAwesomeIcons.chevronLeft,
                                  color: themeColor,
                                ),
                              ),
                            ),
                          ).padding(all: 8),
                          profileRequest.maybeWhen(
                              orElse: () => Container(),
                              data: (profile) {
                                return _PopupButtonActionMenu(
                                    ref, profile!, isReported, isMatchClosed);
                              })
                        ],
                      ),
                    ],
                  )),
              profileRequest.maybeWhen(
                  orElse: () => Center(
                      child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor)
                          .padding(top: 32)),
                  data: (profile) {
                    if (profile == null) {
                      return const Center(
                          child: CustomTextWidget(
                        type: TextWidgetType.heading5,
                        text: ErrorMessages.userNotFound,
                        withRow: false,
                      ));
                    }

                    return Column(children: [
                      if (profile.bio != null)
                        CustomCardWidget(
                          content: Text(profile.bio!)
                              .padding(horizontal: 16, top: 16, bottom: 24),
                        ),
                      CustomCardWidget(
                        content: Column(
                          children: <Widget>[
                            ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: ListTile.divideTiles(tiles: [
                                ...workAndEducationList(
                                    context,
                                    profile.workTitle,
                                    profile.industry,
                                    profile.education)
                              ], context: context)
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                      BasicInfoChipsCard(profile: profile),
                      ...profile.images.map((e) {
                        if (e.id == basicProfile.profilePicture!.id) {
                          return Container();
                        }
                        return CustomCardWidget(
                            content: CustomCachedNetworkImage(
                          imageURL: e.url,
                          cacheKey: e.id.toString(),
                        ));
                      }),
                      SizedBox(
                        height: showCTA ? 104 : 16,
                      )
                    ]);
                  })
            ],
          ),
        ),
      ),
      if (showCTA)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: const [
            FloatingCta(
                heroTag: 'UPSDislike',
                icon: BTBCustomIcons.close,
                color: Colors.white,
                iconColor: themeColor),
            FloatingCta(
                heroTag: 'UPSLike',
                icon: BTBCustomIcons.btbheart,
                color: Colors.white,
                iconColor: Colors.red),
          ],
        ).padding(left: 24, right: 24, bottom: 24),
    ]);
  }
}

class _PopupButtonActionMenu extends StatelessWidget {
  final WidgetRef ref;
  final DetailedProfile profile;
  final bool isReported;
  final bool isMatchClosed;
  const _PopupButtonActionMenu(
      this.ref, this.profile, this.isReported, this.isMatchClosed,
      {Key? key})
      : super(key: key);

  List<PopupMenuItem<ActionMenu>> actions(
    bool isMatchClosed,
    bool isReported,
    DetailedProfile profile,
  ) {
    List<PopupMenuItem<ActionMenu>> result = [];

    if (!isReported) {
      result.add(
        const PopupMenuItem(
            value: ActionMenu.report,
            child: CustomTextWidget(
                type: TextWidgetType.caption, text: LinkTexts.reportUser)),
      );
    }

    if (profile.match == null) {
      return result;
    }

    result.add(const PopupMenuItem(
        value: ActionMenu.conversation,
        child: CustomTextWidget(
            type: TextWidgetType.caption, text: LinkTexts.conversation)));

    if (!isMatchClosed) {
      result.add(const PopupMenuItem(
          value: ActionMenu.close,
          child: CustomTextWidget(
              type: TextWidgetType.caption, text: LinkTexts.unmatch)));
    }

    return result;
  }

  void _onActionSelected(option, BuildContext context) {
    switch (option) {
      case ActionMenu.close:
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
                      onPressed: () => closeMatch(profile.match!.id, ref),
                    ),
                  ],
                ));
        return;
      case ActionMenu.conversation:
        ref
            .read(routerProvider.notifier)
            .navigate(MessagesForMatchScreenRoute(match: profile.match!));
        return;
      case ActionMenu.report:
        ref
            .read(routerProvider.notifier)
            .push(ReportUserScreenRoute(profile: profile));
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem<ActionMenu>> actionsList =
        actions(isMatchClosed, isReported, profile);

    if (actionsList.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        height: 36,
        width: 36,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.80), shape: BoxShape.circle),
        child: Baseline(
          baseline: 27,
          baselineType: TextBaseline.alphabetic,
          child: PopupMenuButton(
            padding: EdgeInsets.zero,
            onSelected: (option) {
              _onActionSelected(option, context);
            },
            offset: const Offset(0, 40),
            icon: const Icon(
              FontAwesomeIcons.ellipsisH,
              color: themeColor,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            itemBuilder: (BuildContext context) =>
                actions(isMatchClosed, isReported, profile),
          ),
        ),
      );
    }

    return Container();
  }
}

class BasicInfoChipsCard extends StatelessWidget {
  final DetailedProfile profile;

  const BasicInfoChipsCard({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      content: Container(
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
                profile.hometown.formatted(),
                avatar: const Icon(
                  FontAwesomeIcons.home,
                  size: 16,
                ),
              ),
            if (profile.heightInCms != null)
              CustomChipWidget(
                profile.heightInCms!.cmToFeetAndInchesAndCmString(),
                avatar: const Icon(
                  FontAwesomeIcons.rulerHorizontal,
                  size: 16,
                ),
              ),
            if (profile.food != null)
              CustomChipWidget(
                profile.food!.name,
                avatar: const Icon(
                  FontAwesomeIcons.utensils,
                  size: 16,
                ),
              ),
            if (profile.drinking != null)
              CustomChipWidget(
                profile.drinking!.name,
                avatar: const Icon(
                  FontAwesomeIcons.beer,
                  size: 16,
                ),
              ),
            if (profile.smoking != null)
              CustomChipWidget(
                profile.smoking!.name,
                avatar: const Icon(
                  FontAwesomeIcons.smoking,
                  size: 16,
                ),
              ),
            if (profile.children != null)
              CustomChipWidget(
                profile.children!.name,
                avatar: const Icon(
                  FontAwesomeIcons.child,
                  size: 16,
                ),
              ),
            if (profile.exercise != null)
              CustomChipWidget(
                profile.exercise!.name,
                avatar: const Icon(
                  FontAwesomeIcons.dumbbell,
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
    );
  }
}
