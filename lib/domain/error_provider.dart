import 'package:hooks_riverpod/hooks_riverpod.dart';

final errorProvider =
    StateNotifierProvider<ErrorNotifier, String?>((_) => ErrorNotifier(null));

class ErrorNotifier extends StateNotifier<String?> {
  ErrorNotifier(String? state) : super(state);

  void updateError(String? message) {
    state = message;
  }
}
