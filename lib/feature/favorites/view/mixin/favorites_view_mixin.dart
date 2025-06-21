import 'package:x_im_v00r01/feature/favorites/view/favorites_view.dart';
import 'package:x_im_v00r01/feature/favorites/view_model/favorites_view_model.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/service/manager/index.dart';
import 'package:x_im_v00r01/product/service/project_service.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';

mixin FavoritesViewMixin on BaseState<FavoritesView> {
  late final ProductNetworkErrorManager productNetworkErrorManager;
  late final FavoritesViewModel favoritesViewModel;

  @override
  void initState() {
    super.initState();
    productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
    favoritesViewModel = FavoritesViewModel(
      operationService: ProjectService(ProductStateItems.productNetworkManager),
      userCacheOperation: ProductStateItems.productCache.userCacheOperation,
      supabaseClient: supabaseClient,
    );
    fetchLullabyFavs();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('asfasdasdas');
  }

  Future<void> fetchLullabyFavs() async {
    favoritesViewModel.changeLoading();
    final response = await supabaseClient
        .from('lullabies')
        .select()
        .order('created_at', ascending: false);

    final favoriteIds =
        favoritesViewModel.userCacheOperation.get('favorites')?.favorites ?? [];

    final favLullaby = response
        .map((json) {
          final model = LulbyModel.fromJson(json);
          final isFav = favoriteIds.contains(model.id);
          return model.copyWith(isFavorite: isFav);
        })
        .where(
          (element) => element.isFavorite == true,
        )
        .toList();
    audioViewModel.changeLullabyFavs(favLullaby);
    favoritesViewModel.changeLoading();
  }

  Future<void> toggleLullabyFav(String lullabyId) async {
    final favoriteIds =
        favoritesViewModel.userCacheOperation.get('favorites')?.favorites ?? [];

    final updatedFavorites = [
      ...favoriteIds,
    ];
    updatedFavorites.remove(lullabyId);
    favoritesViewModel.userCacheOperation.remove(lullabyId);
    favoritesViewModel.userCacheOperation.put(
      'favorites',
      UserCacheModel(
        favorites: updatedFavorites,
      ),
    );
    fetchLullabyFavs();
  }
}
