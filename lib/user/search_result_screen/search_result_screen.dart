import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app_sql/stores/user_store.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({
    Key? key,
    required this.userStore,
  }) : super(key: key);
  final UserStore userStore;

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    final movieModel = widget.userStore.foundedMovies;

    return WillPopScope(
      onWillPop: () async {
        widget.userStore.foundedMovies.clear();
        return true;
      },
      child: Scaffold(
        body: Observer(
          builder: (context) => widget.userStore.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: ListView.separated(
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemCount: movieModel.length,
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.41,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    movieModel[index].poster,
                                    fit: BoxFit.fitHeight,
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        movieModel[index].name,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        movieModel[index].description,
                                        maxLines: 10,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
        ),
      ),
    );
  }
}
