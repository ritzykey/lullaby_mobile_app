import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/product/cache/model/lullaby_cache_model%20copy.dart';

final class UserCacheModel with CacheModel {
  UserCacheModel({
    this.user,
    this.isFirstTime,
    this.themeMode,
    this.language,
    this.selectedTextSize,
    this.fontSize,
    this.favorites,
    this.lullabyCache,
  });

  UserCacheModel.empty()
      : user = LoginResponseModel2(),
        lullabyCache = LullabyCacheModel.empty(),
        isFirstTime = true,
        themeMode = null,
        language = null,
        selectedTextSize = null,
        fontSize = 12.0,
        favorites = [];

  final LoginResponseModel2? user;
  final bool? isFirstTime; // Opsiyonel alan
  final ThemeMode? themeMode;
  final Locale? language;
  final List<bool>? selectedTextSize;
  final double? fontSize;
  final List<String>? favorites;

  final LullabyCacheModel? lullabyCache;

  @override
  String get typeName => 'UserCacheModel'; // sabit string

  @override
  UserCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<LoginResponseModel2>('Json cannot be null');
      return this;
    }
    return copyWith(
      lullabyCache: LullabyCacheModel.empty().fromDynamicJson(json),
      user: LoginResponseModel2.fromJson(jsonMap),
      isFirstTime: jsonMap['isFirstTime'] as bool?, // isFirstTime'ı al!
      themeMode: _stringToThemeMode(jsonMap['themeMode'] as String?),
      language: jsonMap['language'] != null
          ? Locale(jsonMap['language'].toString())
          : null,
      selectedTextSize: (jsonMap['selectedTextSize'] as List<dynamic>?)
          ?.map((e) => e as bool)
          .toList(),
      fontSize: jsonMap['fontSize'] as double?,
      favorites: (jsonMap['favorites'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }

  @override
  String get id => lullabyCache?.lullabyId ?? 'user_01';

  void get audioUrl {}

  @override
  Map<String, dynamic> toJson() {
    return {
      ...(user ?? LoginResponseModel2()).toJson(),
      ...(lullabyCache ?? LullabyCacheModel.empty()).toJson(),
      'isFirstTime': isFirstTime,
      'themeMode': themeMode.toString().split('.').last,
      'language': language?.languageCode,
      'selectedTextSize': selectedTextSize,
      'fontSize': fontSize,
      'favorites': favorites,
    };
  }

  UserCacheModel copyWith({
    List<String>? favorites,
    LoginResponseModel2? user,
    bool? isFirstTime,
    ThemeMode? themeMode,
    Locale? language,
    List<bool>? selectedTextSize,
    double? fontSize,
    LullabyCacheModel? lullabyCache,
  }) {
    return UserCacheModel(
      lullabyCache: lullabyCache ?? this.lullabyCache,
      user: user ?? this.user,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
      selectedTextSize: selectedTextSize ?? this.selectedTextSize,
      fontSize: fontSize ?? this.fontSize,
      favorites: favorites ?? this.favorites,
    );
  }

  /// **Enum String'den ThemeMode'a çevirme**
  ThemeMode? _stringToThemeMode(String? themeModeString) {
    switch (themeModeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return null;
    }
  }
}
