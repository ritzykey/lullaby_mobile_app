import 'dart:developer';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vexana/vexana.dart';

class AudioService {
  AudioService() {
    _audioPlayer.onPlayerComplete.listen((event) {
      _isCompleted = true;
    });
  }
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Dio _dio = Dio();

  /// AudioPlayer instance getter (optional)
  AudioPlayer get instance => _audioPlayer;

  bool _isCompleted = false;
  String? _lastUrl;

  /// Set an audio file from a URL or local path
  Future<void> setUrl(String url) async {
    try {
      await _audioPlayer.setSourceUrl(url);
    } catch (e, stack) {
      log('Error while set source link: $e', stackTrace: stack);
    }
  }

  /// Play audio from URL or local path
  Future<void> play(String url) async {
    try {
      if (url.isEmpty) return;

      // Aynı ses tekrar çalınıyorsa ve daha önce tamamlanmışsa yeniden başlat
      if (_isCompleted || _audioPlayer.state == PlayerState.completed) {
        if (_lastUrl != null) {
          if (_isLocalPath(_lastUrl!)) {
            await _audioPlayer.play(DeviceFileSource(_lastUrl!));
          } else {
            await _audioPlayer.play(UrlSource(_lastUrl!));
          }
        }
        _isCompleted = false;
        return;
      }

      // Zaten oynatılıyorsa tekrar başlatma
      if (_audioPlayer.state == PlayerState.playing && _lastUrl == url) {
        log('Already playing.');
        return;
      }

      _lastUrl = url;

      // Local dosya mı kontrol et
      if (_isLocalPath(url)) {
        await _audioPlayer.play(DeviceFileSource(url));
      } else {
        await _audioPlayer.play(UrlSource(url));
      }
    } catch (e, stack) {
      log('Error while playing audio: $e', stackTrace: stack);
    }
  }

  /// Dosya yolunun local olup olmadığını kontrol eder
  bool _isLocalPath(String path) {
    return path.startsWith('/') ||
        path.startsWith('file://') ||
        File(path).existsSync();
  }

  /// Dosyayı indirip local path döner
  Future<String?> downloadAudio(String? url, String? fileName) async {
    try {
      /* if (Platform.isAndroid) {
        final status = await Permission.storage.request();
        if (!status.isGranted) return null;
      } */
      if (url == null) {
        return '';
      }

      final dir = await getApplicationDocumentsDirectory();
      final filePath = '${dir.path}/$fileName';

      final file = File(filePath);

      if (!await file.exists()) {
        final response = await _dio.download(url, filePath);
        if (response.statusCode != 200) return null;
      }

      return filePath;
    } catch (e) {
      print('Download error: $e');
      return null;
    }
  }

  /// Pause currently playing audio
  Future<void> pause() async {
    try {
      await _audioPlayer.pause();
    } catch (e, stack) {
      log('Error while pausing audio: $e', stackTrace: stack);
    }
  }

  /// Resume paused audio
  Future<void> resume() async {
    try {
      if (_isCompleted) {
        // Eğer ses tamamlandıysa başa sar ve yeniden başlat
        await _audioPlayer.seek(Duration.zero);
      }

      // Her durumda oynatmaya çalış
      await _audioPlayer.resume();
      _isCompleted = false;
    } catch (e, stack) {
      log('Error while resuming audio: $e', stackTrace: stack);
    }
  }

  /// Stop audio completely
  Future<void> stop() async {
    try {
      await _audioPlayer.stop();
    } catch (e, stack) {
      log('Error while stopping audio: $e', stackTrace: stack);
    }
  }

  /// Seek to a specific position in the audio
  Future<void> seek(Duration position) async {
    try {
      await _audioPlayer.seek(position);
    } catch (e, stack) {
      log('Error while seeking: $e', stackTrace: stack);
    }
  }

  /// Set playback volume (0.0 to 1.0)
  Future<void> setVolume(double volume) async {
    try {
      await _audioPlayer.setVolume(volume);
    } catch (e, stack) {
      log('Error while setting volume: $e', stackTrace: stack);
    }
  }

  /// Dispose the audio player
  Future<void> dispose() async {
    try {
      await _audioPlayer.dispose();
    } catch (e, stack) {
      log('Error while disposing audio player: $e', stackTrace: stack);
    }
  }

  /// Set playback speed (e.g., 1.0 = normal, 0.5 = half speed, 2.0 = double)
  Future<void> setPlaybackRate(double rate) async {
    try {
      await _audioPlayer.setPlaybackRate(rate);
    } catch (e, stack) {
      log('Error while setting playback rate: $e', stackTrace: stack);
    }
  }

  /// Get current position
  Future<Duration?> getPosition() async {
    try {
      return await _audioPlayer.getCurrentPosition();
    } catch (e, stack) {
      log('Error getting current position: $e', stackTrace: stack);
      return null;
    }
  }

  /// Listen to player state changes (e.g., playing, paused)
  Stream<PlayerState> get onPlayerStateChanged =>
      _audioPlayer.onPlayerStateChanged;

  /// Listen to position changes
  Stream<Duration> get onPositionChanged => _audioPlayer.onPositionChanged;

  /// Listen to duration updates
  Stream<Duration?> get onDurationChanged => _audioPlayer.onDurationChanged;

  Stream<void> get onPlayerComplate => _audioPlayer.onPlayerComplete;
}
