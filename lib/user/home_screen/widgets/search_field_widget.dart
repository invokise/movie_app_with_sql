import 'package:flutter/material.dart';
import 'package:movie_app_sql/database/database.dart';
import 'package:movie_app_sql/user/search_result_screen/search_result_screen.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({
    Key? key,
    required this.databaseService,
  }) : super(key: key);
  final DatabaseService databaseService;

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: SizedBox(
          height: 85,
          child: Stack(children: [
            TextFormField(
              cursorColor: const Color.fromRGBO(3, 37, 65, 1),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter film name!';
                }

                return null;
              },
              controller: textEditingController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintMaxLines: 2,
                errorStyle: TextStyle(fontSize: 18, color: Colors.red.shade300),
                label: const Text(
                  'Search movie...',
                  style: TextStyle(
                    color: Color.fromRGBO(3, 37, 65, 1),
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromRGBO(3, 37, 65, 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(3, 37, 65, 1),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                height: 60,
                width: 75,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(3, 37, 65, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.databaseService
                          .searchFilm(textEditingController.text);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SearchResultScreen(
                            databaseService: widget.databaseService,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
