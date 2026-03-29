import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  final Uri songsUri = Uri.https(
    'taingchhay-987dd-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/songs.json',
  );

  List<Song>? _cachedSongs;
  @override
  Future<List<Song>> fetchSongs({bool forceFetch = false}) async {
    if (_cachedSongs != null && !forceFetch) 
    return _cachedSongs!;
    
    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> songJson = json.decode(response.body);

      List<Song> result = [];
      for (final entry in songJson.entries) {
        result.add(SongDto.fromJson(entry.key, entry.value));
      }
      _cachedSongs = result;
      return  _cachedSongs!;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {
    return null;
  }

  @override
  Future<void> likeSong(String id, int currentLike) async {
    await http.patch(
      songsUri,
      body: json.encode({SongDto.likeKey: currentLike +1}),
    );
  }
}
