import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

/// Create an instance of CacheOptions with the following properties:
final cacheOptions = CacheOptions(
  // A default store is required for interceptor.
  store: MemCacheStore(),
  // Returns a cached response on error but for statuses 401 & 403.
  // Also allows to return a cached response on network errors (e.g. offline
  // usage).
  // Defaults to [null].
  hitCacheOnErrorExcept: [401, 403],
  // Overrides any HTTP directive to delete entry past this duration.
  // Useful only when origin server has no cache config or custom behaviour is
  // desired.
  // Defaults to [null].
  maxStale: const Duration(days: 180),
  policy: CachePolicy.forceCache,
);
