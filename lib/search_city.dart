import 'package:dart_desafio_final/database/database.dart';
import 'package:dart_desafio_final/repository/city_repository.dart';

Future<void> main() async {
  final database = Database();
  var mysqlConnection = await database.openConn();

  //SELECT CITY + INSERT
  var res = await CityRepository().buscarCity();

  try{
    for (var insertCity in res) {
      await mysqlConnection.query('insert into cidade(id_uf, nome) values (?,?)');
      print(insertCity);
    }
  } on Exception catch(e) {
    print('Erro ao inserir Cidade. Error: $e');
  }

  

  // try {
  //   print('Importação Finalizada!');
  // } catch (e) {
  //   print('Erro ao importar. Error: $e');
  //   mysqlConnection.close();
  // }
}
