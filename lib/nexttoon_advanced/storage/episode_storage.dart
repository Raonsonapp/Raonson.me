import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/episode_model.dart';

class EpisodeStorage {
  static const _key = 'nexttoon_episodes';

  Future<void> saveEpisode(EpisodeModel episode) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await loadEpisodes();
    list.add(episode);
    await prefs.setString(_key, jsonEncode(list.map((e) => e.toJson()).toList()));
  }

  Future<List<EpisodeModel>> loadEpisodes() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return [];
    final decoded = jsonDecode(raw) as List;
    return decoded.map((e) => EpisodeModel.fromJson(e)).toList();
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}