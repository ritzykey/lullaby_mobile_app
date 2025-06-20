import 'package:equatable/equatable.dart';

class LullabiesDownloadedListModel extends Equatable {
  const LullabiesDownloadedListModel({required this.title, required this.audioURL});

  factory LullabiesDownloadedListModel.fromJson(Map<String, dynamic> json) {
    return LullabiesDownloadedListModel(
      title: json['title'] as String,
      audioURL: json['audio_url'] as String,
    );
  }

  final String title;
  final String audioURL;

  @override
  List<Object?> get props => [title, audioURL];
}
