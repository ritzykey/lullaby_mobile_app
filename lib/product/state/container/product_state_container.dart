import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:x_im_v00r01/feature/lullabyHome/service/audio_service.dart';
import 'package:x_im_v00r01/product/cache/product_cache.dart';
import 'package:x_im_v00r01/product/init/config/app_environment.dart';
import 'package:x_im_v00r01/product/service/manager/product_service_manager.dart';
import 'package:x_im_v00r01/product/state/container/index.dart';
import 'package:x_im_v00r01/product/state/view_model/audio_state/audio_view_model.dart';
import 'package:x_im_v00r01/product/state/view_model/product_view_model.dart';

/// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();
  static final _getIt = GetIt.I;

  /// Product core required items
  static Future<void> setup() async {
    print(
      'AppEnvironmentItems.anonKey.value ${AppEnvironmentItems.anonKey.value}',
    );
    print(
      'AppEnvironmentItems.supaUrl.value ${AppEnvironmentItems.supaUrl.value}',
    );

    await Supabase.initialize(
      url: AppEnvironmentItems.supaUrl.value,
      anonKey: AppEnvironmentItems.anonKey.value,
    );

    final hiveCacheManager = HiveCacheManager();
    final productCache = ProductCache(cacheManager: hiveCacheManager);
    await productCache.init();

    _getIt
      ..registerSingleton<ProductCache>(productCache)
      ..registerSingleton<ProductNetworkManager>(ProductNetworkManager.base())
      ..registerLazySingleton<SupabaseClient>(() => Supabase.instance.client)
      ..registerLazySingleton<ProductViewModel>(
        ProductViewModel.new,
      )
      ..registerLazySingleton<AudioViewModel>(
        () => AudioViewModel(ProductStateItems.audioService,
            ProductStateItems.productCache.userCacheOperation),
      )
      ..registerLazySingleton<AudioService>(
        AudioService.new,
      );
  }

  /// read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
