import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin localNotificationsPlugin = .new();
  Future<void> init() async {
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );
    await localNotificationsPlugin.initialize(settings: initializationSettings);
  }

  Future<void> requestAndroidPermissions() async {
    await localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  Future<void> showNotification({
    required int index,
    required String zekr,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'athkari_channel',
          'أذكاري',
          importance: Importance.max,
          priority: Priority.high,
          styleInformation: BigTextStyleInformation(zekr),
        );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await localNotificationsPlugin.show(
      id: index,
      title: 'أذكاري',
      body: zekr,
      notificationDetails: notificationDetails,
    );
  }

  Future<void> cancelAllNotifications() async {
    await localNotificationsPlugin.cancelAll();
  }
}
