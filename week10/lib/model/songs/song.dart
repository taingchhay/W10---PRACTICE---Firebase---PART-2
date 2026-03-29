class Song {
  final String id;
  final String title;
  final String artistId;
  final Duration duration;
  final Uri imageUrl;
  final int like;

  Song({
    required this.id,
    required this.title,
    required this.artistId,
    required this.duration,
    required this.imageUrl,
    this.like =0,
  });

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artist id: $artistId, duration: $duration,)';
  }
}
