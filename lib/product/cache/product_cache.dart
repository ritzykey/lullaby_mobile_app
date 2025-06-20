import 'package:core/core.dart';
import 'package:x_im_v00r01/product/cache/model/lullaby_cache_model%20copy.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';

/// [ProductCache] is a cache manager for the product module.
final class ProductCache {
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init(
      items: [
        UserCacheModel.empty(),
        LullabyCacheModel.empty(),
      ],
    );
  }

  late final HiveCacheOperation<UserCacheModel> userCacheOperation =
      HiveCacheOperation<UserCacheModel>();

  late final HiveCacheOperation<LullabyCacheModel> lullabyCacheOperation =
      HiveCacheOperation<LullabyCacheModel>();
}
