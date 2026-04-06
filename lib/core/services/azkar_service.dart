import 'package:hive_flutter/hive_flutter.dart';

class AzkarService {
  final String _azkariBox = 'azkariBox';
  final String _azkarKey = 'azkariKey';
  final String _currentIndexKey = 'currentIndex';

  List<String> getAzkar() {
    return List<String>.from(
      Hive.box(_azkariBox).get(_azkarKey, defaultValue: []),
    );
  }

  Future<void> saveAzkar({required List<String> azkar}) async {
    await Hive.box(_azkariBox).put(_azkarKey, azkar);
  }

  int getCurrentIndex() {
    return Hive.box(_azkariBox).get(_currentIndexKey, defaultValue: 0);
  }

  Future<void> saveCurrentIndex(int index) async {
    await Hive.box(_azkariBox).put(_currentIndexKey, index);
  }

  Future<void> initDefaultAzkar({required List<String> defaultAzkar}) async {
    final bool isFirstTime = Hive.box(
      _azkariBox,
    ).get('is_first_time', defaultValue: true);
    if (isFirstTime) {
      await saveAzkar(azkar: defaultAzkar);
      await Hive.box(_azkariBox).put('is_first_time', false);
    }
  }

  Future<void> saveInterval(int minutes) async {
    await Hive.box(_azkariBox).put('interval', minutes);
  }

  int getInterval() {
    return Hive.box(_azkariBox).get('interval', defaultValue: 15);
  }
}
