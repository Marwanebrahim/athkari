abstract class IndexRepository {
  int getCurrentIndex();
  Future<void> saveCurrentIndex(int index);
}
