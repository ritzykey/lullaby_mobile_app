import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/lullabiesDownloadedList/view/mixin/lullabiesDownloadedList_view_mixin.dart';
import 'package:x_im_v00r01/feature/lullabiesDownloadedList/view_model/lullabiesDownloadedList_view_model.dart';
import 'package:x_im_v00r01/feature/lullabiesDownloadedList/view_model/state/lullabiesDownloadedList_state.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';

@RoutePage()
class LullabiesDownloadedListView extends StatefulWidget {
  const LullabiesDownloadedListView({super.key});

  @override
  State<LullabiesDownloadedListView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends BaseState<LullabiesDownloadedListView>
    with LullabiesDownloadedListViewMixin {
  @override
  void initState() {
    super.initState();
    lullabiesdownloadedlistViewModel.loadDownloadedLullabies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => lullabiesdownloadedlistViewModel,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<LullabiesDownloadedListViewModel,
              LullabiesDownloadedListState>(
            builder: (context, state) {
              final files = state.downloadedFiles;

              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 100,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      titlePadding: const EdgeInsets.symmetric(horizontal: 16),
                      title: Text(
                        'Downloaded',
                        style: context.general.textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  if (files.isEmpty)
                    const SliverFillRemaining(
                      child: Center(child: Text('İndirilmiş ninni yok')),
                    )
                  else
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final file = files[index];
                          final fileName = file.title ?? '';

                          return ListTile(
                            title: Text(fileName),
                            leading: const Icon(Icons.music_note),
                            trailing: IconButton(
                              icon: const Icon(Icons.play_arrow),
                              onPressed: () async {
                                audioViewModel.changeLullaby([
                                  LulbyModel(
                                    id: file.id,
                                    title: fileName,
                                    audioURL: file.audioUrl ?? '',
                                    artist: 'Anonim',
                                    coverURL: '',
                                  ),
                                ]);
                                await audioService.play(
                                  DeviceFileSource(file.audioUrl ?? '').path,
                                );
                              },
                            ),
                          );
                        },
                        childCount: files.length,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
