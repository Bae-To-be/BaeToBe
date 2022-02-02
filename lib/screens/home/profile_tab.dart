import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/components/custom_divider.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/domain/images_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class ProfileTab extends HookConsumerWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    final _user = ref.watch(userProvider);
    final profilePicture = ref.watch(imagesProvider).profilePicture();

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'My Profile',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ).padding(all: 16),
          const CustomDivider(),
          Stack(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: profilePicture != null
                    ? CachedNetworkImageProvider(profilePicture.url,
                        cacheKey: profilePicture.id.toString())
                    : Image.asset('assets/profile_placeholder.png').image,
                backgroundColor: Theme.of(context).primaryColorLight,
                radius: 75,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: ElevatedButton(
                  onPressed: () {
                    router.pushNamed(AppLinks.editProfile);
                  },
                  child: const Icon(Icons.edit_sharp, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(4),
                    primary: Theme.of(context).primaryColor,
                    onPrimary: Theme.of(context).primaryColorLight,
                  ),
                ),
              )
            ],
          ).padding(vertical: 24),
          Row(
            children: <Widget>[
              Expanded(child: const CustomDivider().padding(right: 6)),
              Text(
                _user.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              Expanded(child: const CustomDivider().padding(left: 6)),
            ],
          ).padding(horizontal: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: Colors.white,
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.cog,
                            color: Theme.of(context).primaryColor,
                          ).padding(right: 10),
                          const Text(
                            'Settings',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          Expanded(child: Container()),
                          Icon(
                            FontAwesomeIcons.chevronRight,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ).padding(all: 16),
                    ),
                    const CustomDivider().padding(horizontal: 16),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.slidersH,
                            color: Theme.of(context).primaryColor,
                          ).padding(right: 10),
                          const Text(
                            'Preferences',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          Expanded(child: Container()),
                          Icon(
                            FontAwesomeIcons.chevronRight,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ).padding(all: 16),
                    ),
                    const CustomDivider().padding(horizontal: 16),
                    TextButton(
                      onPressed: () {
                        router.pushNamed(AppLinks.helpPage);
                      },
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.questionCircle,
                            color: Theme.of(context).primaryColor,
                          ).padding(right: 10),
                          const Text(
                            'FAQs',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          Expanded(child: Container()),
                          Icon(
                            FontAwesomeIcons.chevronRight,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ).padding(all: 16),
                    ),
                  ],
                ),
              ),
            ),
          ).padding(all: 16),
        ],
      ),
    );
  }
}
