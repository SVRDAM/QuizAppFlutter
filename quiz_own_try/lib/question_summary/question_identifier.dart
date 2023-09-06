import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {required this.isCorrect, required this.questionIndex, super.key});

  final bool isCorrect;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    final int questionNumber = questionIndex + 1;
    return Container(
      margin: const EdgeInsets.only(right: 8),
      alignment: Alignment.center,
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: isCorrect == true ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(100)),
      child: Text(questionNumber.toString(),
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }
}
