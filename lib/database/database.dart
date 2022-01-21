import 'package:mysql1/mysql1.dart';

class Database {
  Future<MySqlConnection> openConn() async {
    var connection = MySqlConnection.connect(ConnectionSettings(
      host: '127.0.0.1',
      port: 3306,
      user: 'root',
      password: 'dev2099',
      db: 'dart_desafio_final',
    ));

    await Future.delayed(Duration(microseconds: 100));
    return connection;
  }
}