import 'package:mobx/mobx.dart';
import 'package:movie_app_sql/database/database.dart';
import 'package:movie_app_sql/database/model/movie_model.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  bool loading = false;
  @observable
  List<MovieModel> movieModel = [];
  @observable
  List<MovieModel> foundedMovies = [];

  @action
  Future<List<dynamic>> getAllFilms() async {
    final result = await DatabaseService.connection.query(
      'select * from film left join film_producer on film.film_code = film_producer.film_code group by film.film_code;',
    );

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

    return result.toList();
  }

  @action
  Future<List<dynamic>> searchFilm(String movieName) async {
    final like = "$movieName%";
    final result = await DatabaseService.connection.query(
      'select * from film left join film_producer on film.film_code = film_producer.film_code where film.name like ? group by film.film_code;',
      [like],
    );

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

    return result.toList();
  }
}
