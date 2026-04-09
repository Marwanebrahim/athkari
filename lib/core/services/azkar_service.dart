import 'package:athkari/core/repositories/azkar_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AzkarService implements AzkarRepository {
  final String _azkariBox = 'azkariBox';
  final String _azkarKey = 'azkariKey';

  @override
  Future<void> initDefaultAzkar({required List<String> defaultAzkar}) async {
    final bool isFirstTime = Hive.box(
      _azkariBox,
    ).get('is_first_time', defaultValue: true);
    if (isFirstTime) {
      await saveAzkar(azkar: defaultAzkar);
      await Hive.box(_azkariBox).put('is_first_time', false);
    }
  }

  @override
  List<String> getAzkar() {
    return List<String>.from(
      Hive.box(_azkariBox).get(_azkarKey, defaultValue: []),
    );
  }

  @override
  Future<void> saveAzkar({required List<String> azkar}) async {
    await Hive.box(_azkariBox).put(_azkarKey, azkar);
  }
}
