import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("User"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Admin"),
          ),
        ],
      ),
    );
  }
}
