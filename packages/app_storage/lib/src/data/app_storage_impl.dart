import 'package:app_storage/src/domain/app_storage_abstr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorageImpl implements AppStorage {
  const AppStorageImpl(this.preferences);
  final SharedPreferences preferences;

  @override
  T? getValue<T>(String key, [T Function(String json)? decode]) {
    if (decode != null) {
      final json = preferences.getString(key);
      return json != null ? decode(json) : null;
    }
    return preferences.get(key) as T?;
  }

  @override
  Future<bool> remove(String key) async => preferences.remove(key);

  @override
  Future<bool> setValue<T>(
    String key,
    T value, [
    String Function(T data)? encode,
  ]) async {
    if (encode != null) {
      return preferences.setString(key, encode(value));
    }
    switch (T) {
      case double:
        return preferences.setDouble(key, value as double);
      case bool:
        return preferences.setBool(key, value as bool);
      case String:
        return preferences.setString(key, value as String);
      default:
        throw Exception(
          'The setter for ${value.runtimeType} is not implemented',
        );
    }
  }

  @override
  bool contains(String key) => preferences.containsKey(key);
}
