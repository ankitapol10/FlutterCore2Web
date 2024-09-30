import 'package:flutter/material.dart';

void main() {
  runApp(const AppbarColorApp());
}

class AppbarColorApp extends StatefulWidget {
  const AppbarColorApp({super.key});

  @override
  State<AppbarColorApp> createState() => _AppbarColorAppState();
}

class _AppbarColorAppState extends State<AppbarColorApp> {
  bool colorChange = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App Bar Color",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("AppBar Color App"),
          centerTitle: true,
          backgroundColor: (colorChange) ? Colors.amber : Colors.blue,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Change AppBar Color"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (colorChange) {
              colorChange = false;
            } else {
              colorChange = true;
            }
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
