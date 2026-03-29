import '../../../model/artist/artist.dart';
 

abstract class ArtistRepository {
  Future<List<Artist>> fetchArtists();
  Future<void> likeSong(String id, int currentLike);
  Future<Artist?> fetchArtistById(String id);
}
