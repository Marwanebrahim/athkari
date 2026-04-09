import 'package:athkari/core/repositories/index_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IndexService implements IndexRepository {
  final String _azkariBox = 'azkariBox';
  final String _currentIndexKey = 'currentIndex';

  @override
  int getCurrentIndex() {
    return Hive.box(_azkariBox).get(_currentIndexKey, defaultValue: 0);
  }

  @override
  Future<void> saveCurrentIndex(int index) async {
    await Hive.box(_azkariBox).put(_currentIndexKey, index);
  }
}
