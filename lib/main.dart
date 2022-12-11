import 'package:flutter/material.dart';
import 'package:movie_app_sql/database/database.dart';
import 'package:movie_app_sql/stores/user_store.dart';
import 'package:movie_app_sql/user/user_home_screen/user_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final dbService = DatabaseService();
  await DatabaseService.init();
  // await dbService.getAllFilms();
  runApp(MyApp(
    userStore: UserStore(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.userStore});
  final UserStore userStore;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserHomeScreen(
        userStore: userStore,
      ),
    );
  }
}
