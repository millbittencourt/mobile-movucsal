class PathResponse {
  final String acao;
  final int profundidade;
  final double custo;
  final double heuristica;
  final List<dynamic> teste;

  PathResponse({
    required this.acao,
    required this.profundidade,
    required this.custo,
    required this.heuristica,
    required this.teste,
  });

  factory PathResponse.fromJson(Map<String, dynamic> json) {
    return PathResponse(
      acao: json['acao'],
      profundidade: json['profundidade'],
      custo: json['custo'],
      heuristica: json['heuristica'],
      teste: json['teste'],
    );
  }

  static List<PathResponse>? allFromJson(List<dynamic> json) {
    return json.map((path) => new PathResponse.fromJson(path)).toList();
  }
}
