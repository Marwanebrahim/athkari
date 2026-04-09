abstract class AzkarRepository {
  Future<void> initDefaultAzkar({required List<String> defaultAzkar});
  Future<void> saveAzkar({required List<String> azkar});
  List<String> getAzkar();
}
