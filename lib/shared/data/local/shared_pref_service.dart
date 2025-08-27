import 'package:shared_preferences/shared_preferences.dart';
import 'package:chhoto_khabar/shared/data/local/storage_service.dart';

class SharedPrefsService implements StorageService {
  SharedPreferences? _sharedPreferences;

  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  bool get hasInitialized => _sharedPreferences != null;

  @override
  Future<Object?> get(String key) async {
    return _sharedPreferences?.get(key);
  }

  @override
  Future<void> clear() async {
    await _sharedPreferences?.clear();
  }

  @override
  Future<bool> has(String key) async {
    return _sharedPreferences?.containsKey(key) ?? false;
  }

  @override
  Future<bool> remove(String key) async {
    try {
      return await _sharedPreferences?.remove(key) ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> set(String key, dynamic data) async {
    try {
      if (data is String) {
        return await _sharedPreferences?.setString(key, data) ?? false;
      } else if (data is int) {
        return await _sharedPreferences?.setInt(key, data) ?? false;
      } else if (data is double) {
        return await _sharedPreferences?.setDouble(key, data) ?? false;
      } else if (data is bool) {
        return await _sharedPreferences?.setBool(key, data) ?? false;
      } else if (data is List<String>) {
        return await _sharedPreferences?.setStringList(key, data) ?? false;
      } else {
        // For complex objects, convert to string
        return await _sharedPreferences?.setString(key, data.toString()) ?? false;
      }
    } catch (e) {
      return false;
    }
  }

  // Type-specific implementations
  @override
  Future<String?> getString(String key) async {
    return _sharedPreferences?.getString(key);
  }

  @override
  Future<bool> setString(String key, String value) async {
    try {
      return await _sharedPreferences?.setString(key, value) ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<int?> getInt(String key) async {
    return _sharedPreferences?.getInt(key);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    try {
      return await _sharedPreferences?.setInt(key, value) ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<double?> getDouble(String key) async {
    return _sharedPreferences?.getDouble(key);
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    try {
      return await _sharedPreferences?.setDouble(key, value) ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool?> getBool(String key) async {
    return _sharedPreferences?.getBool(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    try {
      return await _sharedPreferences?.setBool(key, value) ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    return _sharedPreferences?.getStringList(key);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    try {
      return await _sharedPreferences?.setStringList(key, value) ?? false;
    } catch (e) {
      return false;
    }
  }
}