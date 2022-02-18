import 'package:baetobe/components/likes/likes_listing.dart';
import 'package:baetobe/entities/data/like.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LikesReceivedTab extends HookConsumerWidget {
  const LikesReceivedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LikesListing(direction: LikeDirection.received, showCTA: true);
  }
}
