import 'dart:math';
import 'package:restaurant_picker/assets/restaurants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? currentIndex;

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(19);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("What do you want to eat?"),
            const SizedBox(
              height: 20,
            ),
            if (currentIndex != null)
              Text(
                restaurants[currentIndex as int],
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              child: TextButton(
                onPressed: () {
                  updateIndex();
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.cyan),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                child: const Text(
                  "Pick Restaurant",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
