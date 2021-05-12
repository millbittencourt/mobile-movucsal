class Spot {

  final int id;
  final String codigo;
  final String descricao;
  final String predio;
  final bool acessivel;
  final String latitude;
  final String longitude;
  final int altura;
  final String tipoPonto;

  Spot(
      {required this.id, required this.codigo, required this.descricao, required this.predio, required this.acessivel, required this.latitude,
        required this.longitude, required this.altura, required this.tipoPonto});

  factory Spot.fromJson(Map<String, dynamic> json) {
    return Spot(
      id: json['id'],
      codigo: json['codigo'],
      descricao: json['descricao'],
      predio: json['predio'],
      acessivel: json['acessivel'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      altura: json['altura'],
      tipoPonto: json['tipoPonto'],
    );
  }

  static List<Spot>? allFromJson(List<dynamic> json) {
    return json.map((spot) => new Spot.fromJson(spot)).toList();
  }
}