
import 'package:x_im_v00r01/feature/lullabiesDownloadedList/service/lullabiesDownloadedList_service.dart';
import 'package:x_im_v00r01/feature/lullabiesDownloadedList/view/lullabiesDownloadedList_view.dart';
import 'package:x_im_v00r01/feature/lullabiesDownloadedList/view_model/lullabiesDownloadedList_view_model.dart';
import 'package:x_im_v00r01/product/service/manager/index.dart';
import 'package:x_im_v00r01/product/service/project_service.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';

mixin LullabiesDownloadedListViewMixin on BaseState<LullabiesDownloadedListView> {
  late final ProductNetworkErrorManager productNetworkErrorManager;
  late final LullabiesDownloadedListViewModel lullabiesdownloadedlistViewModel;

  @override
  void initState() {
    super.initState();
    productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
    lullabiesdownloadedlistViewModel = LullabiesDownloadedListViewModel(
      operationService: ProjectService(ProductStateItems.productNetworkManager),
      userCacheOperation: ProductStateItems.productCache.userCacheOperation,
      lullabyCacheOperation: ProductStateItems.productCache.lullabyCacheOperation,
      lullabiesdownloadedlistService: SupabaseLullabiesDownloadedListService(supabaseClient),
    );
  }
}
