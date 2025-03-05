abstract class AppStorage {
  Future<bool> remove(String key);
  Future<bool> setValue<T>(
    String key,
    T value, [
    String Function(T data)? encode,
  ]);
  T? getValue<T>(String key, [T Function(String json)? decode]);
  bool contains(String key);
}
