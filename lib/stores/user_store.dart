import 'package:mobx/mobx.dart';
import 'package:movie_app_sql/database/database.dart';
import 'package:movie_app_sql/database/model/movie_model.dart';
part 'user_store.g.dart';

// ignore: library_private_types_in_public_api
class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  bool loading = false;
  @observable
  List<MovieModel> movieModel = [];
  @observable
  List<MovieModel> foundedMovies = [];
  @observable
  bool timeout = false;

  @action
  Future<List<dynamic>> getAllFilms() async {
    loading = true;
    final result = await DatabaseService.connection
        .query(
          'select * from film left join film_producer on film.film_code = film_producer.film_code group by film.film_code;',
        )
        .timeout(const Duration(seconds: 5));

    for (var row in result) {
      movieModel.add(MovieModel(
        filmCode: row[0],
        name: row[1].toString(),
        duration: row[2].toString(),
        filmStudioCode: row[3],
        poster: row[4].toString(),
        description: row[7].toString(),
      ));
    }

    loading = false;

    return result.toList();
  }

  @action
  Future<List<dynamic>> searchFilm(String movieName) async {
    loading = true;
    final like = "$movieName%";
    final result = await DatabaseService.connection.query(
      'select * from film left join film_producer on film.film_code = film_producer.film_code where film.name like ? group by film.film_code;',
      [like],
    ).timeout(const Duration(seconds: 5));

    for (var row in result) {
      foundedMovies.add(MovieModel(
        filmCode: row[0],
        name: row[1].toString(),
        duration: row[2].toString(),
        filmStudioCode: row[3],
        poster: row[4].toString(),
        description: row[7].toString(),
      ));
    }
    loading = false;
    return result.toList();
  }
}
