import 'package:baetobe/components/forms/function_helpers.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final errorProvider =
    StateNotifierProvider<ErrorNotifier, String?>((_) => ErrorNotifier(null));

class ErrorNotifier extends StateNotifier<String?> {
  ErrorNotifier(String? state) : super(state);

  void updateError(String? message) {
    state = message;
  }

  Future<void> safelyExecute(
      {required Future command,
      required Future<void> Function(Response) onSuccess,
      void Function(Object) onError = doNothingWithArgument}) async {
    try {
      final response = await command;
      await onSuccess(response);
    } on DioError catch (e) {
      String? errorMessage;

      if (e.response?.data is Map) {
        errorMessage = e.response?.data['error'];
      }

      updateError(errorMessage ?? ErrorMessages.somethingWentWrong);
      onError(e);
    } catch (e, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(e, stacktrace);
      updateError(ErrorMessages.somethingWentWrong);
      onError(e);
    }
  }
}
