import 'package:flutter/material.dart';
import 'package:avvento_media/apis/fetch_spreaker_api.dart';
import 'package:avvento_media/models/spreakermodels/spreaker_episodes.dart';

class SpreakerEpisodeProvider extends ChangeNotifier {
  List<SpreakerEpisode> _episodes = [];

  List<SpreakerEpisode> get episodes => _episodes;

  Future<void> fetchEpisodes() async {
    try {
      _episodes = await FetchSpreakerAPI.fetchEpisodesForShow();
      notifyListeners();
    } catch (error) {
      // Handle error
    }
  }
}
