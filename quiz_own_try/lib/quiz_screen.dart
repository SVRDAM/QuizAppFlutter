import 'package:flutter/material.dart';
import 'package:quiz_own_try/answer_button.dart';
import 'package:quiz_own_try/data/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  int currentAnswerIndex = 0;

  void selectedAnswer(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currentAnswerIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentAnswer = questions[currentAnswerIndex];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentAnswer.text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            ...currentAnswer.getShuffuledList().map(
                  (answer) => AnswerButton(
                    text: answer,
                    onTap: () {
                      selectedAnswer(answer);
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
