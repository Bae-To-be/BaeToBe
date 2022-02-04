import 'package:auto_route/auto_route.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/article_provider.dart';
import 'package:baetobe/entities/article.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO: Fix navigation issue
//To Reproduce: Open an Article from the listing -> Press Back -> Open Any Article Again -> Press Back -> Takes you to profile page

class HelpPage extends HookConsumerWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const CustomHeaderTile(text: Headings.faqs),
        ArticleListings()
      ],
    );
  }
}

class ArticleListings extends HookConsumerWidget {
  final apiHostURL =
      FirebaseRemoteConfig.instance.getString(RemoteConfigs.apiHostURL);

  ArticleListings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleListing = ref.watch(articleProvider);

    return articleListing.maybeWhen(
      data: (List<Article> listing) => Column(
        children: [
          const CustomHeaderTile(text: Headings.faqs),
          Expanded(
            child: ListView.builder(
                itemCount: listing.length,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    onPressed: () {
                      AutoRouter.of(context).pushNamed(
                          '${AppLinks.helpPage}/${listing[index].id}');
                    },
                    child: ListTile(
                        trailing: const Icon(FontAwesomeIcons.chevronRight),
                        title: Wrap(children: [
                          Text(listing[index].title,
                              style: Theme.of(context).textTheme.subtitle1),
                        ])),
                  );
                }),
          )
        ],
      ),
      orElse: () => Center(
          child:
              CircularProgressIndicator(color: Theme.of(context).primaryColor)),
    );
  }
}
