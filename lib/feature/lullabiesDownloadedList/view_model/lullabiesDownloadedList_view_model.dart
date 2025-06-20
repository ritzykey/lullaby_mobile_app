import 'dart:io';

import 'package:core/core.dart';
import 'package:path_provider/path_provider.dart';
import 'package:x_im_v00r01/feature/lullabiesDownloadedList/service/lullabiesDownloadedList_service.dart';
import 'package:x_im_v00r01/feature/lullabiesDownloadedList/view_model/state/lullabiesDownloadedList_state.dart';
import 'package:x_im_v00r01/product/cache/model/lullaby_cache_model%20copy.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/service/interface/project_operation.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';

final class LullabiesDownloadedListViewModel
    extends BaseCubit<LullabiesDownloadedListState> {
  LullabiesDownloadedListViewModel({
    required ProjectOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
    required HiveCacheOperation<LullabyCacheModel> lullabyCacheOperation,
    required SupabaseLullabiesDownloadedListService
        lullabiesdownloadedlistService,
  })  : _projectOperationService = operationService,
        _userCacheOperation = userCacheOperation,
        _lullabyCacheOperation = lullabyCacheOperation,
        _lullabiesdownloadedlistService = lullabiesdownloadedlistService,
        super(const LullabiesDownloadedListState(isLoading: false));

  final ProjectOperation _projectOperationService;
  final HiveCacheOperation<UserCacheModel> _userCacheOperation;
  final HiveCacheOperation<LullabyCacheModel> _lullabyCacheOperation;
  final SupabaseLullabiesDownloadedListService _lullabiesdownloadedlistService;

  void changeLoading() {
    emit(state.copyWith(isLoading: state.isLoading));
  }

  Future<void> loadDownloadedLullabies() async {
    final downloadedeLullabies = _lullabyCacheOperation.getAll();

    emit(state.copyWith(downloadedFiles: downloadedeLullabies));
  }
}
