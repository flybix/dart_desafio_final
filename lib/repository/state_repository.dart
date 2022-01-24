import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class StateRepository {
  Future buscarEstado() async {
    var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseData = convert.jsonDecode(response.body);

      if (responseData is List) {
        return responseData.toList();
      } else {
        throw Exception();
      }
    }
  }
}
