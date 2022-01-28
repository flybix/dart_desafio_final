import 'package:dart_desafio_final/database/database.dart';
import 'package:dart_desafio_final/repository/city_repository.dart';
import 'package:dart_desafio_final/repository/state_repository.dart';

class SearchDesafio {
  //Insere os Estados no BD...
  Future<void> insertBDState() async {
    final dataBase = Database();
    var mysQL = await dataBase.openConn();

    try {
      var res = await StateRepository().buscarEstado();
      for (var viewState in res) {
        await mysQL.query(
          'insert into estado(uf, nome) values(?, ?)',
          [viewState.uf, viewState.nome],
        );

        print('Estados inserido com sucesso no banco de dados!');
      }
    } on Exception catch (e) {
      print('Erro, ao inserir os estados. Erro: $e');
    }
  }

  // Insere as Cidades no BD...
  Future<void> insertBDCity() async {
    final database = Database();
    var mysqlConn = await database.openConn();

    try {
      var response = await CityRepository().buscarCity(35);
      for (var viewCity in response) {
        await mysqlConn.query(
          'insert into cidade(id_uf, nome) values(?,?)',
          [20, viewCity.nome],
        );

        print('Cidade inserida no Banco de Dados com Sucesso!');
      }
    } 
    on Exception catch (e) {
      print('Erro ao buscar cidade. Erro: $e');
    }
  }
}

void main() {
  SearchDesafio().insertBDState();
  SearchDesafio().insertBDCity();
}
