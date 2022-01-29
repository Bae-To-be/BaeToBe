import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchQueryProvider = StateProvider.autoDispose<String>((ref) => '');
