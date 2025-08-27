/// Storage service interface
abstract class StorageService {
  Future<void> init();

  bool get hasInitialized;

  Future<bool> remove(String key);

  Future<Object?> get(String key);

  Future<bool> set(String key, dynamic data);

  Future<void> clear();

  Future<bool> has(String key);

  // Type-specific methods
  Future<String?> getString(String key);
  Future<bool> setString(String key, String value);
  Future<int?> getInt(String key);
  Future<bool> setInt(String key, int value);
  Future<double?> getDouble(String key);
  Future<bool> setDouble(String key, double value);
  Future<bool?> getBool(String key);
  Future<bool> setBool(String key, bool value);
  Future<List<String>?> getStringList(String key);
  Future<bool> setStringList(String key, List<String> value);
}
