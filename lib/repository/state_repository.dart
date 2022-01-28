import 'package:dart_desafio_final/models/estado.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class StateRepository {
  Future<List<Estado>> buscarEstado() async {
    var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    var response = await http.get(Uri.parse(url));

    // if (response.statusCode == 200) {
    //   var responseData = convert.jsonDecode(response.body);

    //   if (responseData is List) {
    //     return responseData.toList();
    //   } else {
    //     throw Exception();
    //   }
    // }

    if (response.statusCode == 200) {
      var responseData = convert.jsonDecode(response.body);

      //Aqui retorna um Json Array em uma Lista...
      if (responseData is List) {
        return responseData.map((r) {
          return Estado.fromMap(r);
        }).toList(); //toList() recebe todos os dados de uma unica vez...;
      } else {
        throw Exception();
      }
    } else {
      return <Estado>[];
    }
  }
}
