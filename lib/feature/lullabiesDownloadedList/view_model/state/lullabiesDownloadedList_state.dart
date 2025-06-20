import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:x_im_v00r01/product/cache/model/lullaby_cache_model%20copy.dart';

final class LullabiesDownloadedListState extends Equatable {
  const LullabiesDownloadedListState({
    this.isLoading,
    this.downloadedFiles = const [],
    
  });

  final bool? isLoading;
  final List<LullabyCacheModel> downloadedFiles;

  @override
  List<Object?> get props => [isLoading, downloadedFiles];

  LullabiesDownloadedListState copyWith({
    bool? isLoading,
    List<LullabyCacheModel>? downloadedFiles,
  }) {
    return LullabiesDownloadedListState(
      isLoading: isLoading ?? this.isLoading,
      downloadedFiles: downloadedFiles ?? this.downloadedFiles,
    );
  }
}
