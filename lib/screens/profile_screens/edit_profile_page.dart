import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/edit_profile_tile.dart';
import 'package:baetobe/components/forms/big_text_field.dart';
import 'package:baetobe/components/images/image_grid.dart';
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

  String cmToFeetAndInchesAndCmString(int heightInCm) {
    int heightInInches = (heightInCm / 2.54).round();
    int feet = (heightInInches / 12).floor();
    int inches = (heightInInches - (12 * feet)).floor();

    return '$feet\' $inches" ($heightInCm cm)';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    final _user = ref.watch(userProvider);

    useEffect(() {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ref.read(imagesProvider.notifier).loadImages();
      });
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
            const CustomHeaderTile(text: Headings.editProfileLabel),
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
                const EditProfileSectionTile(title: Headings.aboutMeLabel),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.name,
                  content: Text(
                    _user.name,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: false,
                ),
                const EditProfileContentTile(
                  title: EditProfileFieldLabels.bio,
                  content: _BioTextField(),
                  button: false,
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.age,
                  content: Text(
                    _user.age.toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: false,
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.gender,
                  content: Text(
                    _user.gender.toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: true,
                  callback: () {
                    AutoRouter.of(context).pushNamed(
                        '${AppLinks.updateGender}?redirectBack=true');
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.interestedIn,
                  content: Text(
                    _user.interestedGenders.join(', '),
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: true,
                  callback: () {
                    AutoRouter.of(context).pushNamed(
                        '${AppLinks.updateInterestedGenders}?redirectBack=true');
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.hometown,
                  content: Text(
                    _user.hometown.toString() != ''
                        ? _user.hometown.toString()
                        : ErrorMessages.pleaseUpdatePreferences,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: true,
                  callback: () {
                    router.navigateNamed(AppLinks.editHometown);
                    // Get.toNamed(AppLinks.editHometown, arguments: false);
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.religion,
                  content: Text(
                    _user.religion != null
                        ? _user.religion!.name
                        : ErrorMessages.pleaseUpdatePreferences,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: true,
                  callback: () {
                    router.navigateNamed(AppLinks.editReligion);
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.languages,
                  content: Text(
                    _user.languages.map((e) => e.name).join(', ') != ''
                        ? _user.languages.map((e) => e.name).join(', ')
                        : ErrorMessages.pleaseUpdatePreferences,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: true,
                  callback: () {
                    // Get.toNamed(AppLinks.editLanguage, arguments: false);
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.children,
                  content: Text(
                    _user.children != null
                        ? _user.children!.name
                        : ErrorMessages.pleaseUpdatePreferences,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: true,
                  callback: () {
                    // Get.toNamed(AppLinks.editChildren, arguments: false);
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.height,
                  content: Text(
                    _user.height != null
                        ? cmToFeetAndInchesAndCmString(_user.height!)
                        : ErrorMessages.pleaseUpdatePreferences,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: true,
                  callback: () {
                    router.navigateNamed(AppLinks.editHeight);
                  },
                ),
                const EditProfileSectionTile(
                    title: Headings.workAndEducationLabel),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.work,
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _user.workTitle!,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ).padding(bottom: 4),
                      Text(
                        '${_user.company!} | ${_user.industry!}',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
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
                const EditProfileSectionTile(title: Headings.lifestyleLabel),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.food,
                  content: Text(
                    _user.food != null
                        ? _user.food!.name
                        : ErrorMessages.pleaseUpdatePreferences,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: true,
                  callback: () {
                    // Get.toNamed(AppLinks.editFoodPreference,
                    //     arguments: false);
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.smoking,
                  content: Text(
                    _user.smoking != null
                        ? _user.smoking!.name
                        : ErrorMessages.pleaseUpdatePreferences,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: true,
                  callback: () {
                    // Get.toNamed(AppLinks.editSmokingPreference,
                    //     arguments: false);
                  },
                ),
                EditProfileContentTile(
                  title: EditProfileFieldLabels.drinking,
                  content: Text(
                    _user.drinking != null
                        ? _user.drinking!.name
                        : ErrorMessages.pleaseUpdatePreferences,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: true,
                  callback: () {
                    // Get.toNamed(AppLinks.editDrinkingPreference,
                    //     arguments: false);
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
                Icon(FontAwesomeIcons.solidCircle,
                    color: Theme.of(context).primaryColor, size: 10),
                Text(
                  '  ${_user.education[i].universityName} | ${_user.education[i].year}',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ).padding(bottom: 4),
              ],
            ),
            Row(
              children: [
                Text(
                  '    ${_user.education[i].courseName}',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ).padding(bottom: 4),
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
