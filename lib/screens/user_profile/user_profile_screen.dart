import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/components/buttons/custom_text_button.dart';
import 'package:baetobe/components/custom_cached_network_image.dart';
import 'package:baetobe/components/custom_card.dart';
import 'package:baetobe/components/custom_chip.dart';
import 'package:baetobe/components/custom_header_tile.dart';
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

class UserProfileScreen extends HookConsumerWidget {
  final int id;
  final BasicProfile? basicProfile;

  const UserProfileScreen(
      {Key? key, @PathParam('id') required this.id, this.basicProfile})
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
              type: TextWidgetType.caption),
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
            type: TextWidgetType.caption),
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
              type: TextWidgetType.caption,
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
            basicProfile != null
                ? CustomCardWidget(
                    padding: EdgeInsets.zero,
                    content: Column(
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
                                  child: (basicProfile!.profilePicture != null)
                                      ? CustomCachedNetworkImage(
                                          imageURL:
                                              basicProfile!.profilePicture!.url)
                                      : Image.asset(
                                          'assets/profile_placeholder.png'),
                                ),
                              ),
                            )),
                        Hero(
                            tag: '${basicProfile!.userName}$id',
                            child: Text(
                              '${basicProfile!.userName}, ${basicProfile!.age}',
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
                    BasicInfoChipsCard(profile: profile),
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
                    ...profile.images.map((e) {
                      if (e.id == basicProfile!.profilePicture!.id) {
                        return Container();
                      }
                      return CustomCardWidget(
                          content: CustomCachedNetworkImage(
                        imageURL: e.url,
                        cacheKey: e.id.toString(),
                      ));
                    }),
                    ...actions(context, isMatchClosed, isReported, ref, profile)
                  ]);
                })
          ],
        ),
      ),
    );
  }
}

class BasicInfoChipsCard extends StatelessWidget {
  final DetailedProfile profile;

  const BasicInfoChipsCard({Key? key, required this.profile}) : super(key: key);

  String cmToFeetAndInchesAndCmString(int heightInCm) {
    int heightInInches = (heightInCm / 2.54).round();
    int feet = (heightInInches / 12).floor();
    int inches = (heightInInches - (12 * feet)).floor();

    return '$feet\' $inches" ($heightInCm cm)';
  }

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
                cmToFeetAndInchesAndCmString(profile.heightInCms!),
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
