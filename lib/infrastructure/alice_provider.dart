import 'package:alice/alice.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final aliceProvider = Provider<Alice>((ref) {
  return Alice(showNotification: false);
});
