class PathResponse {

  final List pontosVisitados;

  PathResponse({
    required this.pontosVisitados,
  });

  factory PathResponse.fromJson(Map<String, dynamic> json) {
    return PathResponse(
      pontosVisitados: json['pontosVisitados'],
    );
  }

  static List<PathResponse>? allFromJson(List<dynamic> json) {
    return json.map((path) => new PathResponse.fromJson(path)).toList();
  }
}
