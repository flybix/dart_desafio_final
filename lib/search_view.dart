import 'package:dart_desafio_final/database/database.dart';
import 'package:dart_desafio_final/repository/city_repository.dart';

class SearchDesafio {
  //
  Future<void> insertBD() async {
    final database = Database();
    var mysqlConn = await database.openConn();

    try {
      var response = await CityRepository().buscarCity(35);
      for (var viewCity in response) {
        await mysqlConn.query(
          'insert into cidade(id, id_uf, nome) values(?, ?, ?)',
          [null, viewCity.id_uf, viewCity.nome],
        );

        print('Cidade inserida no Banco de Dados com Sucesso!');
      }
    } on Exception catch (e) {
      print('Erro ao buscar cidade. Erro: $e');
    }
  }
}

void main() {
  SearchDesafio().insertBD();
}