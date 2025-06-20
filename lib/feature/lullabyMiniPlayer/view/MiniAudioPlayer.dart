import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';
import 'package:x_im_v00r01/feature/lullabyMiniPlayer/view/mixin/miniAudioPlayer_view_mixin.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/view_model/audio_state/audio_state.dart';
import 'package:x_im_v00r01/product/state/view_model/audio_state/audio_view_model.dart';

class MiniAudioPlayer extends StatefulWidget {
  const MiniAudioPlayer({
    super.key,
  });

  @override
  State<MiniAudioPlayer> createState() => _MiniAudioPlayerState();
}

class _MiniAudioPlayerState extends BaseState<MiniAudioPlayer>
    with MiniAudioPlayerMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => miniAudioPlateyViewModel,
      child: SizedBox(
        height: (context.general.mediaSize.height * 0.23) / 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 97, 224),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const SizedBox(width: 6),
                // Albüm görseli
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: BlocSelector<AudioViewModel, AudioState, String>(
                    selector: (state) {
                      if (state.lullaby.isNotEmpty &&
                          state.lullaby.first.coverURL != null &&
                          state.lullaby.first.coverURL!.isNotEmpty) {
                        return state.lullaby.first.coverURL!;
                      }
                      return 'https://mutluyasam.com.tr/wp-content/uploads/2022/01/ozguvenli-cocuklar-yetistirmek.jpg';
                    },
                    builder: (context, imageUrl) {
                      return Image.network(
                        imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 6),

                // Şarkı ve sanatçı
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 3,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocSelector<AudioViewModel, AudioState,
                                List<LulbyModel>>(
                              selector: (state) {
                                return state.lullaby;
                              },
                              builder: (context, state) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.first.title.length > 21
                                          ? '${state.first.title.substring(0, 21)}...'
                                          : state.first.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      state.first.artist.length > 21
                                          ? '${state.first.artist.substring(0, 21)}...'
                                          : state.first.artist,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                );
                              },
                            ),
                            BlocSelector<AudioViewModel, AudioState, Duration>(
                              selector: (state) {
                                return state.duration;
                              },
                              builder: (context, state) {
                                String formatDuration(
                                  Duration duration,
                                ) {
                                  String twoDigits(int n) =>
                                      n.toString().padLeft(2, '0');
                                  final minutes = twoDigits(
                                    duration.inMinutes.remainder(60),
                                  );
                                  final seconds = twoDigits(
                                    duration.inSeconds.remainder(60),
                                  );
                                  return '$minutes:$seconds';
                                }

                                return Text(
                                  formatDuration(
                                    state,
                                  ), // Total duration
                                  style: context.general.textTheme.bodyMedium
                                      ?.copyWith(
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      BlocSelector<AudioViewModel, AudioState,
                          (Duration, Duration)>(
                        selector: (state) {
                          return (state.position, state.duration);
                        },
                        builder: (context, state) {
                          return SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 6,
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 8,
                              ),
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 16,
                              ),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white.withOpacity(0.5),
                              thumbColor: Colors.white,
                            ),
                            child: Slider(
                              value: state.$1.inSeconds.toDouble().clamp(
                                    0.0,
                                    state.$2.inSeconds.toDouble(),
                                  ),
                              max: state.$2.inSeconds.toDouble(),
                              onChanged: (value) async {
                                final position =
                                    Duration(seconds: value.toInt());
                                await audioService.seek(position);
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // Oynatma Düğmesi
                BlocSelector<AudioViewModel, AudioState, bool>(
                  selector: (state) => state.isPlaying,
                  builder: (context, isPlaying) {
                    return IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        final viewModel = context.read<AudioViewModel>();
                        final currentLullaby = viewModel.state.lullaby.first;

                        if (isPlaying) {
                          await audioService.pause();
                        } else {
                          await audioService.play(currentLullaby.audioURL);
                        }

                        // Cubit güncellemesi unutulmasın!
                        viewModel.changeIsPlaying(!isPlaying);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
