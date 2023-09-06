import 'package:flutter/material.dart';
import 'package:quiz_own_try/question_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({required this.itemData, super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData["userAnswer"] == itemData["correctAnswer"];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            isCorrect: isCorrectAnswer,
            questionIndex: itemData["questionIndex"] as int),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData["question"] as String,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 5),
              Text(
                itemData["userAnswer"] as String,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Text(
                itemData["correctAnswer"] as String,
                style: const TextStyle(color: Colors.green),
              )
            ],
          ),
        ),
      ],
    );
  }
}
