import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/user.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<User>>((ref) {
  return UserNotifier(ref);
});

class UserNotifier extends StateNotifier<AsyncValue<User>> {
  final Ref ref;
  UserNotifier(this.ref)
      : super(AsyncValue.data(User(
            id: 0,
            name: '',
            interestedGenders: [],
            education: [],
            hometown: UserHometown('', ''),
            languages: [])));

  get user => state.value;

  Future<void> loadUser() async {
    state = const AsyncValue.loading();
    final client = ref.read(networkClientProvider);
    final error = ref.read(errorProvider.notifier);
    await error.safelyExecute(
        command: client.get(BackendRoutes.userDetails),
        onSuccess: (response) async {
          state = AsyncValue.data(User.fromJson(response.data['data']));
          await _addAnalyticAttributes();
        },
        onError: (error) => AsyncValue.error(error));
  }

  Future<void> updateAttributes(Map<String, dynamic> attributes) async {
    state = const AsyncValue.loading();
    final client = ref.read(networkClientProvider);
    final error = ref.read(errorProvider.notifier);
    await error.safelyExecute(
        command: client.patch(BackendRoutes.updateUser, data: attributes),
        onSuccess: (response) async {
          state = AsyncValue.data(User.fromJson(response.data['data']));
          await _addAnalyticAttributes();
        },
        onError: (error) => AsyncValue.error(error));
  }

  Future<void> _addAnalyticAttributes() async {
    await FirebaseAnalytics.instance.setUserId(id: state.value!.id.toString());
    if (state.value!.gender != null) {
      await FirebaseAnalytics.instance.setUserProperty(
          name: 'submitted_gender', value: state.value!.gender);
    }
    if (state.value!.workTitle != null) {
      await FirebaseAnalytics.instance.setUserProperty(
          name: 'submitted_work_title', value: state.value!.workTitle);
    }
    if (state.value!.company != null) {
      await FirebaseAnalytics.instance.setUserProperty(
          name: 'submitted_company', value: state.value!.company);
    }
    if (state.value!.religion != null) {
      await FirebaseAnalytics.instance.setUserProperty(
          name: 'submitted_religion', value: state.value!.religion!.name);
    }
  }
}
