import 'package:app_storage/src/domain/storage_event.dart';

abstract class StorageService {
  StorageEvent<String> get authToken;
  StorageEvent<String> get language;
}
