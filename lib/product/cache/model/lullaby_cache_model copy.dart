import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

final class LullabyCacheModel with CacheModel {
  LullabyCacheModel({
    this.lullabyId,
    this.title,
    this.audioUrl,
  });

  LullabyCacheModel.empty()
      : title = '',
        audioUrl = '',
        lullabyId = '';

  final String? lullabyId;
  final String? title;
  final String? audioUrl;

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
    );
  }

  @override
  String get id => lullabyId ?? '';

  @override
  Map<String, dynamic> toJson() {
    return {
      'lullabyId': lullabyId,
      'title': title,
      'audioUrl': audioUrl,
    };
  }

  LullabyCacheModel copyWith({
    String? lullabyId,
    String? title,
    String? audioUrl,
  }) {
    return LullabyCacheModel(
      lullabyId: lullabyId ?? this.lullabyId,
      title: title ?? this.title,
      audioUrl: audioUrl ?? this.audioUrl,
    );
  }
}
