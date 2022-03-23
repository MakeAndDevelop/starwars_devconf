import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

extension DioExtensions on Dio {
  Future<void> addCaching() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: HiveCacheStore('${documentsDirectory.path}/hivecache'),
          maxStale: const Duration(days: 7),
          priority: CachePriority.high,
        ),
      ),
    );
  }
}
