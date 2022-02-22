import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/helper_methods.dart';
import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/components/custom_divider.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/edit_profile_tile.dart';
import 'package:baetobe/components/forms/big_text_field.dart';
import 'package:baetobe/components/images/image_grid.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/form_states/bio_state_provider.dart';
import 'package:baetobe/domain/images_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    final _user = ref.watch(userProvider);

    useEffect(() {
      ref.read(imagesProvider.notifier).loadImages();
      return null;
    }, []);

    return GestureDetector(
      //hides keyboard when tapped outside the keyboard
      onVerticalDragCancel: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            const CustomHeaderTile(
              text: Headings.editProfileLabel,
              headerWith: HeaderWith.cross,
            ),
            const SizedBox(height: 24),
            const ImageGrid(),
            Row(
              children: [
                const Text(
                  InfoLabels.firstPhotoIsProfilePicture,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ).padding(top: 16),
              ],
            ).padding(horizontal: 16, bottom: 16),
            Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                const CustomTextWidget(
                        type: TextWidgetType.heading6,
                        text: Headings.aboutMeLabel)
                    .padding(left: 8, bottom: 10, top: 10),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.name,
                  content: _ContentTextWidget(_user.name),
                  button: false,
                ),
                const CustomDivider().padding(horizontal: 4),
                Column(
                  children: [
                    const CustomTextWidget(
                        type: TextWidgetType.editProfileContentTileTitle,
                        text: EditProfileFieldLabels.bio),
                    const _BioTextField().padding(top: 4)
                  ],
                ).padding(horizontal: 8, vertical: 8),
                // const EditProfileContentTile(
                //   title: EditProfileFieldLabels.bio,
                //   content: _BioTextField(),
                //   button: false,
                // ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.age,
                  content: _ContentTextWidget(_user.age.toString()),
                  button: false,
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.gender,
                  content: _ContentTextWidget(_user.gender.toString()),
                  button: true,
                  callback: () {
                    AutoRouter.of(context).pushNamed(
                        '${AppLinks.updateGender}?redirectBack=true');
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.interestedIn,
                  content:
                      _ContentTextWidget(_user.interestedGenders.join(', ')),
                  button: true,
                  callback: () {
                    AutoRouter.of(context).pushNamed(
                        '${AppLinks.updateInterestedGenders}?redirectBack=true');
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.hometown,
                  content: _ContentTextWidget(_user.hometown.formatted() != ''
                      ? _user.hometown.formatted()
                      : ErrorMessages.pleaseUpdatePreferences),
                  button: true,
                  callback: () {
                    router.navigateNamed(AppLinks.editHometown);
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.religion,
                  content: _ContentTextWidget(_user.religion != null
                      ? _user.religion!.name
                      : ErrorMessages.pleaseUpdatePreferences),
                  button: true,
                  callback: () {
                    router.navigateNamed(AppLinks.editReligion);
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.languages,
                  content: _ContentTextWidget(
                      _user.languages.map((e) => e.name).join(', ') != ''
                          ? _user.languages.map((e) => e.name).join(', ')
                          : ErrorMessages.pleaseUpdatePreferences),
                  button: true,
                  callback: () {
                    router.navigateNamed(AppLinks.editLanguage);
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.children,
                  content: _ContentTextWidget(_user.children != null
                      ? _user.children!.name
                      : ErrorMessages.pleaseUpdatePreferences),
                  button: true,
                  callback: () {
                    router.navigate(UpdatePreferencesScreenRoute(
                        preferenceFor: PreferenceKey.children));
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.height,
                  content: _ContentTextWidget(_user.height != null
                      ? _user.height!.cmToFeetAndInchesAndCmString()
                      : ErrorMessages.pleaseUpdatePreferences),
                  button: true,
                  callback: () {
                    router.navigateNamed(AppLinks.editHeight);
                  },
                ),
                const CustomTextWidget(
                        type: TextWidgetType.heading6,
                        text: Headings.workAndEducationLabel)
                    .padding(left: 8, bottom: 10, top: 10),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.work,
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ContentTextWidget(_user.workTitle!).padding(bottom: 4),
                      _ContentTextWidget(
                          '${_user.company!} | ${_user.industry!}'),
                    ],
                  ),
                  button: false,
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.education,
                  content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _allEducationList(context, ref)),
                  button: false,
                ),
                const CustomTextWidget(
                        type: TextWidgetType.heading6,
                        text: Headings.lifestyleLabel)
                    .padding(left: 8, bottom: 10, top: 10),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.food,
                  content: _ContentTextWidget(_user.food != null
                      ? _user.food!.name
                      : ErrorMessages.pleaseUpdatePreferences),
                  button: true,
                  callback: () {
                    router.navigate(UpdatePreferencesScreenRoute(
                        preferenceFor: PreferenceKey.food));
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.smoking,
                  content: _ContentTextWidget(_user.smoking != null
                      ? _user.smoking!.name
                      : ErrorMessages.pleaseUpdatePreferences),
                  button: true,
                  callback: () {
                    router.navigate(UpdatePreferencesScreenRoute(
                        preferenceFor: PreferenceKey.smoking));
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.drinking,
                  content: _ContentTextWidget(_user.drinking != null
                      ? _user.drinking!.name
                      : ErrorMessages.pleaseUpdatePreferences),
                  button: true,
                  callback: () {
                    router.navigate(UpdatePreferencesScreenRoute(
                        preferenceFor: PreferenceKey.drinking));
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.exercise,
                  content: _ContentTextWidget(_user.exercise != null
                      ? _user.exercise!.name
                      : ErrorMessages.pleaseUpdatePreferences),
                  button: true,
                  callback: () {
                    router.navigate(UpdatePreferencesScreenRoute(
                        preferenceFor: PreferenceKey.exercise));
                  },
                ),
              ],
            ).padding(horizontal: 16, top: 16),
          ],
        ),
      ),
    );
  }

  List<Widget> _allEducationList(context, WidgetRef ref) {
    final _user = ref.read(userProvider);
    List<Widget> result = [];

    for (var i = 0; i < _user.education.length; i++) {
      result.add(
        Column(
          children: [
            Row(
              children: [
                const Baseline(
                    baseline: 5,
                    baselineType: TextBaseline.alphabetic,
                    child: Icon(FontAwesomeIcons.solidCircle,
                        color: themeColor, size: 10)),
                _ContentTextWidget(
                        '  ${_user.education[i].universityName} | ${_user.education[i].year}')
                    .padding(bottom: 4),
              ],
            ),
            Row(
              children: [
                _ContentTextWidget('    ${_user.education[i].courseName}')
                    .padding(bottom: 4),
              ],
            ),
          ],
        ),
      );
    }
    return result;
  }
}

class _BioTextField extends HookConsumerWidget {
  const _BioTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bioState = ref.watch(bioTextProvider);

    return Focus(
      onFocusChange: (hasFocus) async {
        if (!hasFocus) {
          await ref.read(userProvider.notifier).updateAttributes({
            'bio': bioState,
          });
        }
      },
      child: BigFomField(
          value: bioState,
          onChanged: (text) {
            ref.read(bioTextProvider.notifier).state = text;
          }),
    );
  }
}

class _ContentTextWidget extends StatelessWidget {
  final String text;

  const _ContentTextWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextWidget(
      text: text,
      type: TextWidgetType.editProfileContentTileContent,
    );
  }
}
