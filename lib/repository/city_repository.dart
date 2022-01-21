import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CityRepository {
  Future buscarCity() async {
    var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/35/distritos';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseData = convert.jsonDecode(response.body);
      
      //Aqui retorna um Json Array em uma Lista...
      if (responseData is List) {
        return responseData.toList(); //toList() recebe todos os dados de uma unica vez...;
      } else {
        throw Exception();
      }
    }
  }
}
