import 'package:auto_route/auto_route.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/article_provider.dart';
import 'package:baetobe/entities/data/article.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class HelpPage extends HookConsumerWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: const [
        CustomHeaderTile(
          text: Headings.faqs,
          headerWith: HeaderWith.cross,
        ),
        ArticleListings()
      ],
    );
  }
}

class ArticleListings extends HookConsumerWidget {
  const ArticleListings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleListing = ref.watch(articleProvider);

    return articleListing.maybeWhen(
      data: (List<Article> listing) => Expanded(
        child: ListView.builder(
            itemCount: listing.length,
            itemBuilder: (BuildContext context, int index) {
              return TextButton(
                onPressed: () {
                  AutoRouter.of(context)
                      .pushNamed('${AppLinks.helpPage}/${listing[index].id}');
                },
                child: ListTile(
                    trailing: const Icon(FontAwesomeIcons.chevronRight),
                    title: Wrap(children: [
                      Text(listing[index].title,
                          style: Theme.of(context).textTheme.subtitle1),
                    ])),
              );
            }),
      ),
      orElse: () => Expanded(
          child: Lottie.asset('assets/animations/loading_hand_offwhite.json')),
    );
  }
}
