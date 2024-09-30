import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Map> allQuestions = [
    {
      "question":
          "Who developed the Flutter Framework and continues to maintain it today?",
      "options": ["Facebook", "Microsoft", "Google", "Oracle"],
      "correctAnswer": 2
    },
    {
      "question":
          "Which function will return the widgets attached to the screen as a root of the widget tree to be rendered on screen?",
      "options": ["main()", "runApp()", "container()", "root()"],
      "correctAnswer": 1
    },
    {
      "question":
          "Which component allows us to specify the distance between widgets on the screen?",
      "options": ["SizeBar", "SizeBox", "SizedBar", "SizedBox"],
      "correctAnswer": 3
    },
    {
      "question": "Which programming language is used to code in Flutter??",
      "options": ["Java", "Dart", "Kotlin", "Swift"],
      "correctAnswer": 1
    },
    {
      "question":
          "What command would you run to verify your Flutter install and ensure your environment is set up correctly?",
      "options": [
        "Flutter run",
        "Flutter build",
        "Flutter doctor",
        "Flutter help"
      ],
      "correctAnswer": 2
    },
  ];
  
  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  int score = 0; // Variable to store the score
  bool questionPage = true;

  WidgetStateProperty<Color?> checkAnswer(int answerIndex) {
    if (selectedAnswerIndex != -1) {
      if (answerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]) {
        return const WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(null);
      }
    } else {
      return const WidgetStatePropertyAll(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }

  Scaffold isQuestionScreen() {
    if (questionPage == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              )),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                const SizedBox(
                  width: 110,
                ),
                Text(
                  "Question : ${currentQuestionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
           SizedBox(
                width: 500,
                height: 100,
                child: Text(allQuestions[currentQuestionIndex]["question"],
                    style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: Colors.black))),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(0),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 0;
                    setState(() {});
                  }
                },
                child: Text(
                    "A. ${allQuestions[currentQuestionIndex]['options'][0]}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.purple)),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(1),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 1;
                    setState(() {});
                  }
                },
                child: Text(
                    "B. ${allQuestions[currentQuestionIndex]['options'][1]}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.purple)),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(2),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 2;
                    setState(() {});
                  }
                },
                child: Text(
                    "C. ${allQuestions[currentQuestionIndex]['options'][2]}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.purple)),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 3;
                    setState(() {});
                  }
                },
                style: ButtonStyle(
                  backgroundColor: checkAnswer(3),
                ),
                child: Text(
                    "D. ${allQuestions[currentQuestionIndex]['options'][3]}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.purple)),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(         onPressed: () {
            if (selectedAnswerIndex != -1) {
              if (selectedAnswerIndex ==
                  allQuestions[currentQuestionIndex]["correctAnswer"]) {
                score++;
              }

              if (currentQuestionIndex < allQuestions.length - 1) {
                currentQuestionIndex++;
              } else {
                questionPage = false;
              }
              selectedAnswerIndex = -1;
              setState(() {});
            }
          },
          backgroundColor: Colors.purple,
          child: const Icon(Icons.forward, color: Colors.white),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz Result",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr3e8mScDg24Sq3HueSQSQOoIFYxJqeKzK_Q&s",
                height: 300,
              ),
              const SizedBox(height: 30),
              const Text(
                "Well Done",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 30),
              Text("Your Score is: $score / ${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  )),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Reset all state variables to restart the quiz
                  setState(() {
                    currentQuestionIndex = 0;
                    selectedAnswerIndex = -1;
                    score = 0;
                    questionPage = true;
                  });
                },
                style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text(
                  "Restart Quiz",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
