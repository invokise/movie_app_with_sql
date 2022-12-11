import 'package:flutter/material.dart';
import 'package:movie_app_sql/database/database.dart';
import 'package:movie_app_sql/user/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final dbService = DatabaseService();
  await DatabaseService.init();
  // await dbService.getAllFilms();
  runApp(MyApp(databaseService: dbService));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.databaseService});
  final DatabaseService databaseService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(
        databaseService: databaseService,
      ),
    );
  }
}
