import 'package:athkari/core/services/azkar_service.dart';
import 'package:athkari/core/services/index_service.dart';
import 'package:athkari/core/services/notification_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    await Hive.initFlutter();
    await Hive.openBox("azkariBox");

    final AzkarService azkarService = .new();
    final IndexService indexService = .new();
    final NotificationService notificationService = .new();
    await notificationService.init();
    List<String> azkar = azkarService.getAzkar();
    int currentIndex = indexService.getCurrentIndex();
    String currentZekr = azkar[currentIndex];
    await notificationService.showNotification(
      index: currentIndex,
      zekr: currentZekr,
    );
    await indexService.saveCurrentIndex((currentIndex + 1) % azkar.length);
    return Future.value(true);
  });
}
