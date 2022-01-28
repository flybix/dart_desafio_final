import 'dart:convert';

class Cidade {
  final int id;
  final String idUf;
  final String nome;
  Cidade({
    required this.id,
    required this.idUf,
    required this.nome,
  });

  //Aqui gera uma cidade, baseado em chave e valor.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_uf': idUf,
      'nome': nome,
    };
  }

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      id: int.tryParse(map['id']) ?? 0,
      idUf: map['id_uf'] ?? '',
      nome: map['nome'] ?? '',
    );
  }

  // Aqui pega a instancia e transforma no map e decodifica ela para um Json
  String toJson() => json.encode(toMap());

  //Aqui decodifica a cidade o source, e gera um Json decode...
  factory Cidade.fromJson(String source) => Cidade.fromMap(json.decode(source));

  @override
  String toString() => 'Cidade(id: $id, id_uf: $idUf, nome: $nome)';
}