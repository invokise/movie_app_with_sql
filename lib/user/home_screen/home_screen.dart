import 'package:flutter/material.dart';
import 'package:movie_app_sql/database/database.dart';
import 'package:movie_app_sql/user/home_screen/widgets/search_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.databaseService,
  }) : super(key: key);
  final DatabaseService databaseService;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final movieModel = widget.databaseService.movieModel;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
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
            SearchFieldWidget(
              databaseService: widget.databaseService,
            ),
          ],
        ),
      ),
    );
  }
}
