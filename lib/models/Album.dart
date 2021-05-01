//todo: change to Spot
class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  static List<Album>? allFromJson(List<dynamic> json) {
    return json.map((album) => new Album.fromJson(album)).toList();
  }
}