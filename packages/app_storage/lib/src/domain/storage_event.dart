import 'package:app_storage/src/domain/app_storage_abstr.dart';

class StorageEvent<T> {
  StorageEvent({
    required this.appStorage,
    required this.key,
    this.encode,
    this.decode,
  });

  final String key;
  final AppStorage appStorage;
  final String Function(T data)? encode;
  final T Function(String json)? decode;

  Future<bool> remove() async => appStorage.remove(key);

  Future<bool> save(T data) async => appStorage.setValue(key, data, encode);

  T? load() => appStorage.getValue<T>(key, decode);
}
