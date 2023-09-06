import 'package:flutter/material.dart';
import 'package:quiz_own_try/data/questions.dart';
import 'package:quiz_own_try/quiz_screen.dart';
import 'package:quiz_own_try/results_screen.dart';
import 'package:quiz_own_try/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> answers = [];
  void addAnswer(String answer) {
    answers.add(answer);
    if (answers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void restart() {
    setState(() {
      answers = [];
      activeScreen = "quiz-screen";
    });
  }

  String activeScreen = "start-screen";
  void switchScreen() {
    setState(() {
      activeScreen = "quiz-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "start-screen") {
      screenWidget;
    } else if (activeScreen == "quiz-screen") {
      screenWidget = QuizScreen(onSelectedAnswer: addAnswer);
    } else if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        choosenAnwser: answers,
        restart: restart,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
