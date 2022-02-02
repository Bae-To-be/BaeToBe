import 'dart:convert';

import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/domain/likes_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/domain/verification_info_provider.dart';
import 'package:baetobe/entities/like.dart';
import 'package:baetobe/infrastructure/secure_storage_provider.dart';
import 'package:baetobe/utils/datetime.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationsProvider = Provider((ref) => NotificationService(ref));

class NotificationService {
  Ref ref;

  NotificationService(this.ref);

  Future<void> setupNotifications(Ref ref) async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.max,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_notification');
    var initializationSettingsIos = const IOSInitializationSettings();

    final initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIos);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) {
      switch (payload) {
        case NotificationEvents.newMessage:
          // Get.until((route) => Get.currentRoute == AppLinks.homePage);
          // Get.offNamed(HomeRoutes.matches, id: homeRouterKey);
          break;
        case NotificationEvents.newMatch:
          // Get.until((route) => Get.currentRoute == AppLinks.homePage);
          // Get.offNamed(HomeRoutes.matches, id: homeRouterKey);
          break;
        case NotificationEvents.newLike:
          ref
              .read(routerProvider.notifier)
              .push(const HomepageScreenRoute(children: [LikesTabRoute()]));
          break;
      }
    });

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _messageDataReactions(message, true);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;

      _messageDataReactions(message, false);
      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null) {
        // if (!_notificationPreferences.whileAppOpen.value) {
        //   return;
        // }
        switch (message.data['event']) {
          case NotificationEvents.newMessage:
            // final matchId = int.parse(message.data['match_id']);
            // if (Get.currentRoute != AppLinks.messages(matchId: matchId)) {
            //   showNotification(flutterLocalNotificationsPlugin, notification,
            //       channel, message.data['event']);
            // }
            break;
          case NotificationEvents.leftSwiped:
            break;
          default:
            _showNotification(flutterLocalNotificationsPlugin, notification,
                channel, message.data['event']);
            break;
        }
      }
    });

    final storage = ref.read(secureStorageProvider);
    if (!kDebugMode) {
      String? value = await storage.read(key: StorageKeys.fcmTimestamp);
      if (value != null &&
          (DateTime.now().difference(dateFormat.parse(value)).inDays < 7)) {
        return;
      }
    }

    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      await ref
          .read(userProvider.notifier)
          .updateAttributes({'fcm_token': token});
    }
    if (!kDebugMode) {
      await storage.write(
          key: StorageKeys.fcmTimestamp,
          value: dateFormat.format(DateTime.now()));
    }
  }

  void _showNotification(
      FlutterLocalNotificationsPlugin plugin,
      RemoteNotification notification,
      AndroidNotificationChannel channel,
      String eventName) {
    plugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description, color: themeColor),
        ),
        payload: eventName);
  }

  Future<void> _messageDataReactions(
      RemoteMessage message, bool appOpen) async {
    if (message.data['event'] != null) {
      switch (message.data['event']) {
        case NotificationEvents.verificationUpdate:
          await ref.read(verificationInfoProvider.notifier).loadInfo();
          await ref
              .read(routerProvider.notifier)
              .replaceAll([const VerificationRejectedScreenRoute()]);
          break;
        case NotificationEvents.newMatch:
          // if (Get.isRegistered<MatchesController>()) {
          //   Get.find<MatchesController>().addOrUpdateMatch(
          //       Match.fromJson(jsonDecode(message.data['match'])));
          // } else if (appOpen) {
          //   await Get.offNamed(AppLinks.homePage);
          //   await Get.offNamed(HomeRoutes.matches, id: homeRouterKey);
          // }
          break;
        case NotificationEvents.newLike:
          if (appOpen) {
            await ref
                .read(routerProvider.notifier)
                .push(const HomepageScreenRoute(children: [LikesTabRoute()]));
            return;
          }
          ref
              .read(likesProvider(likeDirection.received).notifier)
              .addOrUpdateLike(Like.fromJson(jsonDecode(message.data['like'])));
          break;
        case NotificationEvents.leftSwiped:
          debugPrint(message.data.toString());
          ref
              .read(likesProvider(likeDirection.sent).notifier)
              .removeLike(int.parse(message.data['like_id']));
          break;
        case NotificationEvents.newMessage:
          // if (Get.isRegistered<MatchesController>()) {
          //   final matchId = int.parse(message.data['match_id']);
          //   final updatedAt = int.parse(message.data['updated_at']);
          //   Get.find<MatchesController>().updateMatchInfo(matchId, updatedAt);
          // } else if (appOpen) {
          //   await Get.offNamed(AppLinks.homePage);
          //   await Get.offNamed(HomeRoutes.matches, id: homeRouterKey);
          // }
          break;
      }
    }
  }
}
