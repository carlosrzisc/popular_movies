import 'package:app_storage/src/data/app_storage_impl.dart';
import 'package:app_storage/src/domain/app_storage_abstr.dart';
import 'package:app_storage/src/domain/storage_event.dart';
import 'package:app_storage/src/domain/storage_keys.dart';
import 'package:app_storage/src/domain/storage_service_abstr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServiceImpl implements StorageService {
  StorageServiceImpl(SharedPreferences sharedPreferences)
    : _appStorage = AppStorageImpl(sharedPreferences);
  final AppStorage _appStorage;

  @override
  StorageEvent<String> get authToken =>
      StorageEvent<String>(appStorage: _appStorage, key: StorageKeys.authToken);

  @override
  StorageEvent<String> get language =>
      StorageEvent<String>(appStorage: _appStorage, key: StorageKeys.language);
}
