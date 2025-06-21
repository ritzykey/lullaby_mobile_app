import 'package:equatable/equatable.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';
import 'package:x_im_v00r01/product/cache/model/lullaby_cache_model%20copy.dart';

final class AudioState extends Equatable {
  const AudioState({
    required this.isLoading,
    required this.isPlaying,
    required this.duration,
    required this.position,
    required this.lullaby,
    required this.lullabyFavs,
    this.downloadedLullabyIds = const [],
  });

  final bool? isLoading;
  final bool isPlaying;
  final Duration duration;
  final Duration position;

  final List<LulbyModel> lullaby;
  final List<LulbyModel>? lullabyFavs;
  final List<LullabyCacheModel> downloadedLullabyIds;

  @override
  List<Object?> get props => [
        isLoading,
        isPlaying,
        duration,
        position,
        lullaby,
        lullabyFavs,
        downloadedLullabyIds,
      ];

  AudioState copyWith({
    bool? isLoading,
    bool? isPlaying,
    Duration? duration,
    Duration? position,
    List<LulbyModel>? lullaby,
    List<LulbyModel>? lullabyFavs,
    List<LullabyCacheModel>? downloadedLullabyIds,
  }) {
    return AudioState(
      isLoading: isLoading ?? this.isLoading,
      isPlaying: isPlaying ?? this.isPlaying,
      duration: duration ?? this.duration,
      position: position ?? this.position,
      lullaby: lullaby ?? this.lullaby,
      lullabyFavs: lullabyFavs ?? this.lullabyFavs,
      downloadedLullabyIds: downloadedLullabyIds ?? this.downloadedLullabyIds,
    );
  }
}
