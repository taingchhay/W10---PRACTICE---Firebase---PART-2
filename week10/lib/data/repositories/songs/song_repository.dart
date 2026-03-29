import '../../../model/songs/song.dart';

abstract class SongRepository {
  Future<List<Song>> fetchSongs();
  Future<void> likeSong(String id, int currentLike);
  Future<Song?> fetchSongById(String id);
}
