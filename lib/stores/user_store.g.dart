// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: '_UserStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$movieModelAtom =
      Atom(name: '_UserStoreBase.movieModel', context: context);

  @override
  List<MovieModel> get movieModel {
    _$movieModelAtom.reportRead();
    return super.movieModel;
  }

  @override
  set movieModel(List<MovieModel> value) {
    _$movieModelAtom.reportWrite(value, super.movieModel, () {
      super.movieModel = value;
    });
  }

  late final _$foundedMoviesAtom =
      Atom(name: '_UserStoreBase.foundedMovies', context: context);

  @override
  List<MovieModel> get foundedMovies {
    _$foundedMoviesAtom.reportRead();
    return super.foundedMovies;
  }

  @override
  set foundedMovies(List<MovieModel> value) {
    _$foundedMoviesAtom.reportWrite(value, super.foundedMovies, () {
      super.foundedMovies = value;
    });
  }

  late final _$timeoutAtom =
      Atom(name: '_UserStoreBase.timeout', context: context);

  @override
  bool get timeout {
    _$timeoutAtom.reportRead();
    return super.timeout;
  }

  @override
  set timeout(bool value) {
    _$timeoutAtom.reportWrite(value, super.timeout, () {
      super.timeout = value;
    });
  }

  late final _$getAllFilmsAsyncAction =
      AsyncAction('_UserStoreBase.getAllFilms', context: context);

  @override
  Future<List<dynamic>> getAllFilms() {
    return _$getAllFilmsAsyncAction.run(() => super.getAllFilms());
  }

  late final _$searchFilmAsyncAction =
      AsyncAction('_UserStoreBase.searchFilm', context: context);

  @override
  Future<List<dynamic>> searchFilm(String movieName) {
    return _$searchFilmAsyncAction.run(() => super.searchFilm(movieName));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
movieModel: ${movieModel},
foundedMovies: ${foundedMovies},
timeout: ${timeout}
    ''';
  }
}
