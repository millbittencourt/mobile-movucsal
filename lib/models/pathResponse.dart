class PathResponse {

  final int profundidade;
  final double custo;
  final double heuristica;
  final List pontosVisitados;

  PathResponse({
    required this.profundidade,
    required this.custo,
    required this.heuristica,
    required this.pontosVisitados,
  });

  factory PathResponse.fromJson(Map<String, dynamic> json) {
    return PathResponse(
      profundidade: json['profundidade'],
      custo: json['custo'],
      heuristica: json['heuristica'],
      pontosVisitados: json['pontosVisitados1'],
    );
  }

  static List<PathResponse>? allFromJson(List<dynamic> json) {
    return json.map((path) => new PathResponse.fromJson(path)).toList();
  }
}
