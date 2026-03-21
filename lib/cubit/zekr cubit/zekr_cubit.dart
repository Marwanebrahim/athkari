import 'package:athkari/core/constants/app_strings.dart';
import 'package:athkari/core/services/azkar_service.dart';
import 'package:athkari/cubit/zekr%20cubit/zekr_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZekrCubit extends Cubit<ZekrState> {
  final AzkarService azkarService = .new();
  ZekrCubit() : super(ZekrInitial());

  void initDefaultAdhkar() {
    azkarService.initDefaultAzkar(defaultAzkar: ApPStrings.defaultAdhkar);
  }

  void getAdhkar() {
    emit(ZekrLoading());
    try {
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

  void editAdhkar({
    required int index,
    required String newZekr,
    required List<String> azkar,
  }) async {
    try {
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
}
