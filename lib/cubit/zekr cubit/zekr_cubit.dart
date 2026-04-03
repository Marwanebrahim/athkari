import 'package:athkari/core/constants/app_strings.dart';
import 'package:athkari/core/services/azkar_service.dart';
import 'package:athkari/core/services/notification_service.dart';
import 'package:athkari/cubit/zekr%20cubit/zekr_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmanager/workmanager.dart';

class ZekrCubit extends Cubit<ZekrState> {
  final AzkarService azkarService = .new();
  final NotificationService notificationService = .new();
  final Workmanager workmanager = .new();
  ZekrCubit() : super(ZekrInitial());

  Future<void> initDefaultAdhkar() async {
    await azkarService.initDefaultAzkar(defaultAzkar: ApPStrings.defaultAdhkar);
    await azkarService.saveInterval(15);
    await notificationService.init();
    await notificationService.requestAndroidPermissions();
    await workmanager.registerPeriodicTask(
      'athkari_notification_task',
      'athkari_notification_task',
      frequency: Duration(minutes: getInterval()),
    );
  }

  Future<void> getAdhkar() async {
    try {
      emit(ZekrLoading());
      List<String> adhkar = azkarService.getAzkar();
      int currentIndex = getCurrentIndex();
      emit(ZekrLoaded(adhkar: adhkar, currentIndex: currentIndex));
    } catch (e) {
      emit(ZekrError(message: e.toString()));
    }
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
    return azkarService.getCurrentIndex();
  }

  Future<void> saveCurrentIndex(int index) async {
    await azkarService.saveCurrentIndex(index);
  }

  Future<void> saveInterval(int minutes) async {
    await azkarService.saveInterval(minutes);
  }

  int getInterval() {
    return azkarService.getInterval();
  }
}
