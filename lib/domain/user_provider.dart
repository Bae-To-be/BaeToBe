import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:baetobe/domain/verification_info_provider.dart';
import 'package:baetobe/entities/data/user_hometown.dart';
import 'package:baetobe/entities/user.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(ref);
});

class UserNotifier extends StateNotifier<User> {
  final Ref ref;
  UserNotifier(this.ref)
      : super(User(
            id: 0,
            name: '',
            interestedGenders: [],
            education: [],
            hometown: UserHometown(countryName: '', cityName: ''),
            languages: []));

  User get user => state;

  Future<void> loadUser() async {
    final loading = ref.read(loadingProvider.notifier);
    loading.state = true;
    final client = ref.read(networkClientProvider);
    final error = ref.read(errorProvider.notifier);
    await error.safelyExecute(
        command: client.get(BackendRoutes.userDetails),
        onSuccess: (response) async {
          state = User.fromJson(response.data['data']);
          await _addAnalyticAttributes();
        });
    loading.state = false;
  }

  Future<void> updateAttributes(Map<String, dynamic> attributes,
      {String? routeTo}) async {
    final loading = ref.read(loadingProvider.notifier);
    loading.state = true;
    final client = ref.read(networkClientProvider);
    final error = ref.read(errorProvider.notifier);
    final router = ref.read(routerProvider);
    await error.safelyExecute(
        command: client.patch(BackendRoutes.updateUser, data: attributes),
        onSuccess: (response) async {
          state = User.fromJson(response.data['data']);
          await _addAnalyticAttributes();
          loading.state = false;
          if (ref.read(verificationInfoProvider.notifier).info?.status ==
              ApprovalStatuses.rejected) {
            await ref.read(verificationInfoProvider.notifier).loadInfo();
          }
          if (routeTo != null) {
            if (routeTo == AppLinks.back) {
              await router.pop();
              return;
            }
            await router.pushNamed(routeTo);
          }
        },
        onError: (_) => loading.state = false);
  }

  Future<void> _addAnalyticAttributes() async {
    await FirebaseAnalytics.instance.setUserId(id: state.id.toString());
    if (state.gender != null) {
      await FirebaseAnalytics.instance
          .setUserProperty(name: 'submitted_gender', value: state.gender);
    }
    if (state.workTitle != null) {
      await FirebaseAnalytics.instance.setUserProperty(
          name: 'submitted_work_title', value: state.workTitle);
    }
    if (state.company != null) {
      await FirebaseAnalytics.instance
          .setUserProperty(name: 'submitted_company', value: state.company);
    }
    if (state.religion != null) {
      await FirebaseAnalytics.instance.setUserProperty(
          name: 'submitted_religion', value: state.religion!.name);
    }
  }
}
