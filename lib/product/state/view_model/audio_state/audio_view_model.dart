import 'package:core/core.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';
import 'package:x_im_v00r01/feature/lullabyHome/service/audio_service.dart';
import 'package:x_im_v00r01/product/cache/model/lullaby_cache_model%20copy.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';
import 'package:x_im_v00r01/product/state/view_model/audio_state/audio_state.dart';

final class AudioViewModel extends BaseCubit<AudioState> {
  AudioViewModel(this._audioService, this._lullabyCacheOperation)
      : super(
          const AudioState(
            isLoading: true,
            isPlaying: false,
            duration: Duration(minutes: 3, seconds: 11),
            position: Duration.zero,
            lullaby: [
              LulbyModel(
                id: '',
                audioURL: '',
                title: '**** ****** *****',
                artist: 'Anonim',
              ),
            ],
            lullabyFavs: [],
          ),
        );
  final AudioService _audioService;
  final HiveCacheOperation<LullabyCacheModel> _lullabyCacheOperation;

  void changeLoading() {
    emit(state.copyWith(isLoading: state.isLoading));
  }

  void changeIsPlaying(bool playerState) {
    emit(state.copyWith(isPlaying: playerState));
  }

  void changeDuration(Duration duration) {
    emit(state.copyWith(duration: duration));
  }

  void changePosition(Duration position) {
    emit(state.copyWith(position: position));
  }

  void changeLullaby(List<LulbyModel> lullaby) {
    emit(state.copyWith(lullaby: lullaby));
  }

  void changeLullabyFavs(List<LulbyModel> lullaby) {
    emit(state.copyWith(lullabyFavs: lullaby));
  }

   void changeDownloadedLullabyIds(List<String> lullaby) {
    emit(state.copyWith(downloadedLullabyIds: lullaby));
  }

  Future<bool> downloadLullaby({required LullabyCacheModel item}) async {
    final path =
        await _audioService.downloadAudio(item.audioUrl, item.lullabyId);
    _lullabyCacheOperation.add(item.copyWith(audioUrl: path));
    if (path != null) {
      final updated = List<String>.from(state.downloadedLullabyIds);
      if (!updated.contains(item.lullabyId)) {
        updated.add(item.lullabyId ?? '');
        emit(state.copyWith(downloadedLullabyIds: updated));
      }
      return true;
    }
    return false;
  }
}
