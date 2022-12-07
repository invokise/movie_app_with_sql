import 'package:mysql1/mysql1.dart';

class DatabaseService {
  // Future<MySqlConnection> connect() async {
  //   var settings = ConnectionSettings(
  //       host: 'localhost',
  //       port: 3306,
  //       user: 'root',
  //       password: '586746',
  //       db: 'films');
  //   return await MySqlConnection.connect(settings);
  // }
  // Future<MySqlConnection> connectToDB() async {
  //   var settings = ConnectionSettings(
  //       host: '10.0.2.2',
  //       port: 3306,
  //       user: 'root',
  //       password: '586746',
  //       db: 'films');
  //   return await MySqlConnection.connect(settings);
  // }

  late final MySqlConnection connection;

  init() async {
    // var s = ConnectionSettings(
    //   user: "root", //todo: username
    //   password: "586746", //todo: password
    //   host: "10.0.2.2", //todo: the local ip of the computer in flutter
    //   // port: 3306, //todo: port
    //   db: "films", //todo: the database to be connected
    // );
    //todo: Get database connection
    // await MySqlConnection.connect(s).then((connection) {
    //   this.connection = connection;
    //   print('go');
    // });

    var settings = new ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'root',
      password: '586746',
      db: 'films',
      characterSet: CharacterSet.UTF8,
    );
    connection = await MySqlConnection.connect(settings);
    var userId = 1;
    var result = await connection.query(
      'select * from film',
    );
    for (var row in result) {
      print(row);
      print('Name: ${row[0]}, email: ${row[1]}');
    }

    print(result);
  }

  Future<List<dynamic>> getAllFilms() async {
    // final connection = await connectToDB();

    // final result = await connection.query('select * from film');
    // print(result);
    // return result.toList();
    return Future.delayed(Duration(seconds: 1)).then((value) => []);
  }

  Future<dynamic> closeDB(MySqlConnection connection) async {
    await connection.close();
  }
}
