import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

final class LullabyCacheModel with CacheModel {
  LullabyCacheModel({
    required this.lullabyId,
    required this.title,
    required this.audioUrl,
    required this.artist,
    this.coverURL,
    this.isFavorite,
    this.isDownloaded,
  });

  LullabyCacheModel.empty()
      : lullabyId = 'lullabyId_01',
        title = '',
        audioUrl = '',
        artist = 'Anonim',
        coverURL = '',
        isFavorite = null,
        isDownloaded = null;

  final String lullabyId;
  final String title;
  final String audioUrl;
  final String artist;
  final String? coverURL;
  final bool? isFavorite;
  final bool? isDownloaded;

  @override
  LullabyCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<LoginResponseModel2>('Json cannot be null');
      return this;
    }
    return copyWith(
      lullabyId: jsonMap['lullabyId'] as String?,
      title: jsonMap['title'] as String?,
      audioUrl: jsonMap['audioUrl'] as String?,
      artist: jsonMap['artist'] as String?,
      coverURL: jsonMap['coverURL'] as String?,
      isFavorite: jsonMap['isFavorite'] as bool?,
      isDownloaded: jsonMap['isDownloaded'] as bool?,
    );
  }

  @override
  String get id => lullabyId;

  @override
  String get typeName => 'LullabyCacheModel'; // sabit string

  @override
  Map<String, dynamic> toJson() {
    return {
      'lullabyId': lullabyId,
      'title': title,
      'audioUrl': audioUrl,
      'artist': artist,
      'coverURL': coverURL,
      'isFavorite': isFavorite,
      'isDownloaded': isDownloaded,
    };
  }

  LullabyCacheModel copyWith({
    String? lullabyId,
    String? title,
    String? audioUrl,
    String? artist,
    bool? isFavorite,
    bool? isDownloaded,
    String? coverURL,
  }) {
    return LullabyCacheModel(
      lullabyId: lullabyId ?? this.lullabyId,
      title: title ?? this.title,
      audioUrl: audioUrl ?? this.audioUrl,
      artist: artist ?? this.artist,
      coverURL: coverURL ?? this.coverURL,
      isFavorite: isFavorite ?? this.isFavorite,
      isDownloaded: isDownloaded ?? this.isDownloaded,
    );
  }
}
