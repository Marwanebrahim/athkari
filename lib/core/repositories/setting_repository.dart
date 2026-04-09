abstract class SettingRepository {
  Future<void> saveInterval(int minutes);
  int getInterval();
}
