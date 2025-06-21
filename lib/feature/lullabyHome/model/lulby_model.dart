import 'package:equatable/equatable.dart';

class LulbyModel extends Equatable {
  const LulbyModel({
    required this.id,
    required this.title,
    required this.audioURL,
    required this.artist,
    this.coverURL,
    this.isFavorite = false,
  });

  factory LulbyModel.fromJson(Map<String, dynamic> json) {
    return LulbyModel(
      id: json['id'] as String,
      title: json['title'] as String,
      audioURL: json['audio_url'] as String,
      artist: json['artist'] as String,
      coverURL: json['cover_url'] as String,
    );
  }

  final String title;
  final String audioURL;
  final String artist;
  final String? coverURL;
  final String id;
  final bool? isFavorite;

  @override
  List<Object?> get props =>
      [id, title, audioURL, artist, coverURL, isFavorite];

  LulbyModel copyWith({bool? isFavorite}) {
    return LulbyModel(
      id: id,
      title: title,
      audioURL: audioURL,
      artist: artist,
      coverURL: coverURL,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
