import 'package:flutter/material.dart';
import 'package:movie_app_sql/database/database.dart';
import 'package:movie_app_sql/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbService = DatabaseService();
  // final connection = await dbService.connectToDB();
  // await connection.query(
  //     'INSERT INTO producer (producer_code, first_name, last_name, date_of_birth, gender) VALUES (8, "Charise", "Smith", "female")');
  await dbService.init();
  // dbService.connection.query()
  await dbService.getAllFilms();
  // final res = await dbService.getAllFilms(connection);

  // for (var row in res) {
  //   print(row);
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
