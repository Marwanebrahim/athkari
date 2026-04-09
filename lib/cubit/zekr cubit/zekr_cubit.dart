import 'package:athkari/core/constants/app_strings.dart';
import 'package:athkari/core/repositories/azkar_repository.dart';
import 'package:athkari/core/repositories/index_repository.dart';
import 'package:athkari/core/repositories/setting_repository.dart';
import 'package:athkari/core/services/azkar_service.dart';
import 'package:athkari/core/services/index_service.dart';
import 'package:athkari/core/services/notification_service.dart';
import 'package:athkari/core/services/setting_service.dart';
import 'package:athkari/cubit/zekr%20cubit/zekr_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmanager/workmanager.dart';

class ZekrCubit extends Cubit<ZekrState> {
  final AzkarRepository azkarService = AzkarService();
  final IndexRepository indexService = IndexService();
  final SettingRepository settingService = SettingService();
  final NotificationService notificationService = .new();
  final Workmanager workmanager = .new();
  ZekrCubit() : super(ZekrInitial());

  Future<void> initDefaultAdhkar() async {
    await azkarService.initDefaultAzkar(defaultAzkar: ApPStrings.defaultAdhkar);
    await notificationService.init();
    await notificationService.requestAndroidPermissions();
    await registerTask();
  }

  Future<void> getAdhkar() async {
    try {
      emit(ZekrLoading());
      List<String> adhkar = azkarService.getAzkar();
      int currentIndex = getCurrentIndex();
      emit(
        ZekrLoaded(
          adhkar: adhkar,
          currentIndex: currentIndex,
          interval: getInterval(),
        ),
      );
    } catch (e) {
      emit(ZekrError(message: e.toString()));
    }
  }

  Future<void> registerTask() async {
    await workmanager.registerPeriodicTask(
      'athkari_notification_task',
      'athkari_notification_task',
      frequency: Duration(minutes: getInterval()),
    );
  }

  Future<void> cancelTask() async {
    await workmanager.cancelAll();
  }

  void saveAdhkar({required String zekr}) async {
    try {
      List<String> azkar = azkarService.getAzkar();
      if (!azkar.contains(zekr)) {
        azkar.add(zekr);
      }
      await azkarService.saveAzkar(azkar: azkar);
      getAdhkar();
    } catch (e) {
      emit(ZekrError(message: e.toString()));
    }
  }

  void deleteAdhkar({required int index}) async {
    try {
      List<String> azkar = azkarService.getAzkar();
      azkar.removeAt(index);
      await azkarService.saveAzkar(azkar: azkar);
      getAdhkar();
    } catch (e) {
      emit(ZekrError(message: e.toString()));
    }
  }

  void editAdhkar({required int index, required String newZekr}) async {
    try {
      List<String> azkar = azkarService.getAzkar();
      azkar[index] = newZekr;
      await azkarService.saveAzkar(azkar: azkar);
      getAdhkar();
    } catch (e) {
      emit(ZekrError(message: e.toString()));
    }
  }

  int getCurrentIndex() {
    return indexService.getCurrentIndex();
  }

  Future<void> saveCurrentIndex(int index) async {
    await indexService.saveCurrentIndex(index);
  }

  Future<void> saveInterval(int minutes) async {
    await settingService.saveInterval(minutes);
    getAdhkar();
  }

  int getInterval() {
    return settingService.getInterval();
  }
}
