import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/components/custom_divider.dart';
import 'package:baetobe/components/edit_profile_tile.dart';
import 'package:baetobe/components/images/image_tile.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class EditProfile extends HookConsumerWidget {
  const EditProfile({Key? key}) : super(key: key);

  String cmToFeetAndInchesAndCmString(int heightInCm) {
    int heightInInches = (heightInCm / 2.54).round();
    int feet = (heightInInches / 12).floor();
    int inches = (heightInInches - (12 * feet)).floor();

    return '$feet\' $inches" ($heightInCm cm)';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    final _user = ref.read(userProvider);
    // return const Center(child: Text('EDIT PROFILE'),);
    return GestureDetector(
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
            GFListTile(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                title: Text('Edit Profile',
                    style: Theme.of(context).textTheme.headline5),
                icon: IconButton(
                  icon: Icon(FontAwesomeIcons.solidTimesCircle,
                      color: Theme.of(context).primaryColor, size: 20),
                  onPressed: () => router.pop(),
                )),
            const CustomDivider(),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 3),
              itemCount: FirebaseRemoteConfig.instance
                  .getInt(RemoteConfigs.maxPhotoCount),
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (BuildContext ctx, index) {
                return ImageTile(position: index);
              },
            ),
            Row(
              children: [
                const Text(
                  'Your first picture is your profile picture.',
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
                const EditProfileSectionTile(title: 'About Me'),
                EditProfileContentTile(
                  title: 'Name',
                  content: Text(
                    _user.name,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: false,
                ),
                const EditProfileContentTile(
                  title: 'Bio',
                  content: _BioTextField(),
                  button: false,
                ),
                EditProfileContentTile(
                  title: 'Age',
                  content: Text(
                    _user.age.toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: false,
                ),
                EditProfileContentTile(
                  title: 'Gender',
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
                  title: 'Interested In',
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
                  title: 'Hometown',
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
                  title: 'Religion',
                  content: Text(
                    _user.religion != null
                        ? _user.religion!.name
                        : ErrorMessages.pleaseUpdatePreferences,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: true,
                  callback: () {
                    // Get.toNamed(AppLinks.editReligion, arguments: false);
                  },
                ),
                EditProfileContentTile(
                  title: 'Languages',
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
                  title: 'Children',
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
                  title: 'Height',
                  content: Text(
                    _user.height != null
                        ? cmToFeetAndInchesAndCmString(_user.height!)
                        : ErrorMessages.pleaseUpdatePreferences,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  button: true,
                  callback: () {
                    // Get.toNamed(AppLinks.editHeight, arguments: false);
                  },
                ),
                const EditProfileSectionTile(title: 'Work and Education'),
                EditProfileContentTile(
                  title: 'Work',
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
                  button: true,
                  callback: () {
                    AutoRouter.of(context).pushNamed(
                        '${AppLinks.updateWorkDetails}?redirectBack=true');
                    // Get.toNamed(AppLinks.updateWorkDetails, arguments: false);
                  },
                ),
                EditProfileContentTile(
                  title: 'Education',
                  content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _allEducationList(context, ref)),
                  button: true,
                  callback: () {
                    AutoRouter.of(context).pushNamed(
                        '${AppLinks.updateEducationHistory}?redirectBack=true');
                  },
                ),
                const EditProfileSectionTile(title: 'Lifestyle'),
                EditProfileContentTile(
                  title: 'Food',
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
                  title: 'Smoking',
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
                  title: 'Drinking',
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

//
class _BioTextField extends HookConsumerWidget {
  const _BioTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _user = ref.read(userProvider);

    return Focus(
      onFocusChange: (hasFocus) async {
        if (!hasFocus) {
          await ref.read(userProvider.notifier).updateAttributes({
            'bio': _user.bio,
          });
        }
      },
      child: TextFormField(
        initialValue: _user.bio ?? '',
        minLines: 3,
        style: const TextStyle(fontSize: 14),
        maxLines: 20,
        maxLength: 500,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Theme.of(context).primaryColorLight, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: Theme.of(context).primaryColorLight, width: 1),
          ),
        ),
        onChanged: (text) {
          _user.bio = text;
        },
      ),
    );
  }
}
