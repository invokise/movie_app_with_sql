import 'package:mysql1/mysql1.dart';

abstract class DatabaseService {
  static late final MySqlConnection connection;
  // final List<MovieModel> movieModel = [];
  // final List<MovieModel> foundedMovies = [];

  static Future<dynamic> init() async {
    final settings = ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'root',
      password: '586746',
      db: 'films',
      characterSet: CharacterSet.UTF8,
    );

    connection = await MySqlConnection.connect(settings);
    await Future.delayed(const Duration(seconds: 1));
  }

  // Future<List<dynamic>> getAllFilms() async {
  //   // final result = await connection.query(
  //   //   'select * from film',
  //   // );
  //   final result = await connection.query(
  //     'select * from film left join film_producer on film.film_code = film_producer.film_code group by film.film_code;',
  //   );

  //   for (var row in result) {
  //     movieModel.add(MovieModel(
  //       filmCode: row[0],
  //       name: row[1].toString(),
  //       duration: row[2].toString(),
  //       filmStudioCode: row[3],
  //       poster: row[4].toString(),
  //       description: row[7].toString(),
  //     ));
  //   }

  //   return result.toList();
  // }

  // Future<List<dynamic>> searchFilm(String movieName) async {
  //   final like = "$movieName%";
  //   final result = await connection.query(
  //     'select * from film left join film_producer on film.film_code = film_producer.film_code where film.name like ? group by film.film_code;',
  //     [like],
  //   );

  //   for (var row in result) {
  //     foundedMovies.add(MovieModel(
  //       filmCode: row[0],
  //       name: row[1].toString(),
  //       duration: row[2].toString(),
  //       filmStudioCode: row[3],
  //       poster: row[4].toString(),
  //       description: row[7].toString(),
  //     ));
  //   }

  //   return result.toList();
  // }

  static Future<dynamic> closeDB(MySqlConnection connection) async {
    await connection.close();
  }
}
