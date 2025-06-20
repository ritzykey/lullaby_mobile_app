import 'package:x_im_v00r01/feature/lullabiesList/view/lullabiesList_view.dart';
import 'package:x_im_v00r01/feature/lullabiesList/view_model/lullabiesList_view_model.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';
import 'package:x_im_v00r01/product/service/manager/index.dart';
import 'package:x_im_v00r01/product/service/project_service.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';

mixin LullabiesListViewMixin on BaseState<LullabiesListView> {
  late final ProductNetworkErrorManager productNetworkErrorManager;
  late final LullabiesListViewModel lullabiesListViewModel;

  late final Future<List<LulbyModel>> lullabiesFuture;

  @override
  void initState() {
    super.initState();
    productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
    lullabiesListViewModel = LullabiesListViewModel(
      operationService: ProjectService(ProductStateItems.productNetworkManager),
      userCacheOperation: ProductStateItems.productCache.userCacheOperation,
    );
    lullabiesFuture = _getLullabies(widget.path);
    changeFavList(null);
  }

  Future<List<LulbyModel>> _getLullabies(int? categoryId) async {
    if (categoryId == null) {
      return [];
    }

    final response = await supabaseClient
        .from('lullabies')
        .select()
        .eq('category', categoryId)
        .order('created_at', ascending: false);

    final favoriteIds =
        lullabiesListViewModel.userCacheOperation.get('favorites')?.favorites ??
            [];

    return response.map((json) {
      final model = LulbyModel.fromJson(json);
      final isFav = favoriteIds.contains(model.id);
      return model.copyWith(isFavorite: isFav);
    }).toList();
  }

  Future<void> changeFavList(List<String>? updatedFavorites) async {
    final response = await supabaseClient
        .from('lullabies')
        .select()
        .order('created_at', ascending: false);

    if (updatedFavorites == null) {
      final favoriteIds = lullabiesListViewModel.userCacheOperation
              .get('favorites')
              ?.favorites ??
          [];
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

      final downloadedeLullabies =
          ProductStateItems.productCache.lullabyCacheOperation
              .getAll()
              .map(
                (e) => e.id ?? '',
              )
              .toList();

      audioViewModel.changeDownloadedLullabyIds(
        downloadedeLullabies,
      );
      return;
    }

    final favLullaby = response
        .map((json) {
          final model = LulbyModel.fromJson(json);
          final isFav = updatedFavorites.contains(model.id);
          return model.copyWith(isFavorite: isFav);
        })
        .where(
          (element) => element.isFavorite == true,
        )
        .toList();
    audioViewModel.changeLullabyFavs(favLullaby);
  }
}
