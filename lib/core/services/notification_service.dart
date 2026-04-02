import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

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

  Future<void> scheduleNotification({
    required int index,
    required String zekr,
    required Duration interval,
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

    await localNotificationsPlugin.zonedSchedule(
      id: index,
      title: 'اؔذكاري',
      body: zekr,
      scheduledDate: tz.TZDateTime.now(tz.local).add(interval),
      notificationDetails: notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> cancelAllNotifications() async {
    await localNotificationsPlugin.cancelAll();
  }
}
