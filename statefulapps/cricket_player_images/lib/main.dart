import 'package:flutter/material.dart';

void main() {
  runApp(const PlayersApp());
}

class PlayersApp extends StatefulWidget {
  const PlayersApp({super.key});
  @override
  State<PlayersApp> createState() => _PlayersAppState();
}

class _PlayersAppState extends State<PlayersApp> {
  int _counter = 0;
  List<String> playerList = <String>[
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjYXm0bKrsV1VZPuyaq-j009UD1aBDCUz5A&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-5W2Maj7kQFJb_0zOdr30p8ZDpQ24OdA3Og&s",
    "https://upload.wikimedia.org/wikipedia/commons/1/1e/Prime_Minister_Of_Bharat_Shri_Narendra_Damodardas_Modi_with_Shri_Rohit_Gurunath_Sharma_%28Cropped%29.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/f/fc/Hardik_Pandya_in_PMO_New_Delhi.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Players",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Players App"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                playerList[_counter],
                height: 300,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_counter < playerList.length - 1) {
              _counter++;
            } else {
              _counter = 0;
            }
            setState(() {});
          },
          tooltip: 'Increment',
          child: const Icon(Icons.forward),
        ),
      ),
    );
  }
}
