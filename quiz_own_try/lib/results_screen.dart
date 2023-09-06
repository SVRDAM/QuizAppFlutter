import 'package:flutter/material.dart';
import 'package:quiz_own_try/data/questions.dart';
import 'package:quiz_own_try/question_summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.choosenAnwser, required this.restart});
  final List<String> choosenAnwser;
  final void Function() restart;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnwser.length; i++) {
      summary.add({
        "questionIndex": i,
        "question": questions[i].text,
        "correctAnswer": questions[i].answers[0],
        "userAnswer": choosenAnwser[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getSummary();
    final totalAnswer = questions.length;
    final numCorrectAnswer = summeryData.where((data) {
      return data["userAnswer"] == data["correctAnswer"];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
              "You answered $numCorrectAnswer out of $totalAnswer questions correctly !",
              style: const TextStyle(color: Colors.white, fontSize: 17)),
          const SizedBox(
            height: 30,
          ),
          QuestionSummary(summaryData: getSummary()),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
              onPressed: restart,
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              icon: const Icon(Icons.refresh),
              label: const Text("Restart Quiz")),
        ]),
      ),
    );
  }
}
