//import 'package:dart_desafio_final/database/database.dart';
import 'package:dart_desafio_final/database/database.dart';
import 'package:dart_desafio_final/repository/city_repository.dart';

Future<void> main() async {
  final database = Database();
  var mysqlConnection = await database.openConn();

  //SELECT CITY + INSERT
  var res = await CityRepository().buscarCity();

  for (var insertCity in res) {
    await res(insertCity: insertCity, mysqlConnection: mysqlConnection);
  }
  

  // try {
  //   print('Importação Finalizada!');
  // } catch (e) {
  //   print('Erro ao importar. Error: $e');
  //   mysqlConnection.close();
  // }
}
