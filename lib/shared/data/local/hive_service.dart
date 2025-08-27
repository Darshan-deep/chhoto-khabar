import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:chhoto_khabar/shared/data/local/storage_service.dart';

class HiveService implements StorageService {
  Box? _box;

  final Completer<void> _initCompleter = Completer<void>();

  @override
  Future<void> init() async {
    try {
      await Hive.initFlutter();
      _box = await Hive.openBox('chhoto_khabar_storageBox');
      _initCompleter.complete();
    } catch (e) {
      if (!_initCompleter.isCompleted) {
        _initCompleter.completeError(e);
      }
      rethrow;
    }
  }

  @override
  bool get hasInitialized => _box != null && _initCompleter.isCompleted;

  @override
  Future<Object?> get(String key) async {
    await _initCompleter.future;
    return _box?.get(key);
  }

  @override
  Future<void> clear() async {
    await _initCompleter.future;
    await _box?.clear();
  }

  @override
  Future<bool> has(String key) async {
    await _initCompleter.future;
    return _box?.containsKey(key) ?? false;
  }

  @override
  Future<bool> remove(String key) async {
    try {
      await _initCompleter.future;
      await _box?.delete(key);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> set(String key, dynamic data) async {
    try {
      await _initCompleter.future;
      await _box?.put(key, data);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Type-specific implementations
  @override
  Future<String?> getString(String key) async {
    try {
      await _initCompleter.future;
      final value = _box?.get(key);
      return value is String ? value : null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> setString(String key, String value) async {
    return await set(key, value);
  }

  @override
  Future<int?> getInt(String key) async {
    try {
      await _initCompleter.future;
      final value = _box?.get(key);
      if (value is int) return value;
      if (value is String) return int.tryParse(value);
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return await set(key, value);
  }

  @override
  Future<double?> getDouble(String key) async {
    try {
      await _initCompleter.future;
      final value = _box?.get(key);
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value);
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    return await set(key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    try {
      await _initCompleter.future;
      final value = _box?.get(key);
      if (value is bool) return value;
      if (value is String) {
        if (value.toLowerCase() == 'true') return true;
        if (value.toLowerCase() == 'false') return false;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return await set(key, value);
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    try {
      await _initCompleter.future;
      final value = _box?.get(key);
      if (value is List) {
        return value.cast<String>();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    return await set(key, value);
  }
}