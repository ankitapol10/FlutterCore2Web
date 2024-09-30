import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Indian Flag",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.lightBlueAccent,
            ),
            body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.lightBlueAccent, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        //Pole
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 500, width: 5, color: Colors.black),
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 250,
                                    color: Colors.orange,
                                  ),
                                  Container(
                                      height: 50,
                                      width: 250,
                                      color: Colors.white,
                                      child: Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1osO3UBh058R7CAi7VtiCS6kdUOH9ujBPZw&s")),
                                  Container(
                                    height: 50,
                                    width: 250,
                                    color: Colors.green,
                                  )
                                ],
                              )
                            ]))))));
  }
}
