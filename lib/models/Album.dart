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

  static List<Album>? allFromJson(Map<String, dynamic> json) {
    print('to aqui - allFromJson');
    List<dynamic> dynList = json['result'];

    return dynList.map((item) => Album.fromJson(item)).toList();
  }
}