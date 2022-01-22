import 'package:dart_desafio_final/database/database.dart';
import 'package:dart_desafio_final/repository/city_repository.dart';

Future<void> main() async {
  final database = Database();
  var mysqlConnection = await database.openConn();

  //SELECT CITY + INSERT
  var res = await CityRepository().buscarCity();

  try {
    for (var cityInsert in res) {
      await mysqlConnection.query('insert into cidade(id, nome) values(?, ?)', [
        
      ]);
      print(cityInsert);
    }
  } on Exception catch (e) {
    print('Erro ao buscar cidade. $e');
  }
  
}
