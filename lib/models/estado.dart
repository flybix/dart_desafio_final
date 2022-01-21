import 'dart:convert';

class Estado {
  final int id;
  final String uf;
  final String nome;
  Estado({
    required this.id,
    required this.uf,
    required this.nome,
  });

  //Generate Json
  factory Estado.fromMap(Map<String, dynamic> map) {
    return Estado(
      id: map['id']?.toInt() ?? 0,
      uf: map['uf'] ?? '',
      nome: map['nome'] ?? '',
    );
  }

  factory Estado.fromJson(source) => Estado.fromMap(jsonDecode(source));

  //Transfomar em Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uf': uf,
      'nome': nome,
    };
  }

  //Aqui tranforma em Json
  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Estado(id: $id, uf: $uf, nome: $nome)';

}
