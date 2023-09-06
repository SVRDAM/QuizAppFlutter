import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          height: 300,
          width: 300,
          color: const Color.fromRGBO(0, 0, 0, 0.925),
        ),
        const SizedBox(height: 50),
        const Text(
          "Easy Way To Learn Flutter",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "Start Quiz",
              style: TextStyle(fontSize: 18),
            ))
      ],
    );
  }
}
