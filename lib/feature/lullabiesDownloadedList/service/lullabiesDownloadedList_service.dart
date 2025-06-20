import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:x_im_v00r01/feature/lullabiesDownloadedList/model/lullabiesDownloadedList_model.dart';

abstract class LullabiesDownloadedListService {
  Future<List<LullabiesDownloadedListModel>>
      getLullabiesDownloadedListStories();
  Future<List<LullabiesDownloadedListModel>> getLegendaryFootballers();
}

class SupabaseLullabiesDownloadedListService
    implements LullabiesDownloadedListService {
  SupabaseLullabiesDownloadedListService(this._client);
  final SupabaseClient _client;

  @override
  Future<List<LullabiesDownloadedListModel>>
      getLullabiesDownloadedListStories() async {
    final response =
        await _client.from('LullabiesDownloadedList_stories').select();
    return response.map(LullabiesDownloadedListModel.fromJson).toList();
  }

  @override
  Future<List<LullabiesDownloadedListModel>> getLegendaryFootballers() async {
    final response = await _client.from('legendary_footballers').select();
    return response.map(LullabiesDownloadedListModel.fromJson).toList();
  }
}
