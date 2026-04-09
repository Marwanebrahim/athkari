import 'package:athkari/core/repositories/setting_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingService implements SettingRepository {
  final String _azkariBox = 'azkariBox';
  final String _intervalKey = 'interval';
  @override
  Future<void> saveInterval(int minutes) async {
    await Hive.box(_azkariBox).put(_intervalKey, minutes);
  }

  @override
  int getInterval() {
    return Hive.box(_azkariBox).get(_intervalKey, defaultValue: 15);
  }
}
