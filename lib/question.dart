
import 'package:flutter/material.dart';
import 'package:quizapp/models/QuizQuestion.dart';
import 'questions.dart';

class Questions extends StatefulWidget {
  const Questions(this.answers,{Key? key}) : super(key: key);

  final void Function(String) answers;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int curr = 0;
  
  void nextQuestion(String e) {
    widget.answers(e);
    setState(() {
      curr++;
      if(curr == questions.length-1)
      {
        curr=0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion currentQuestion = questions[curr];
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            style: const TextStyle(
              color: Colors.amber,
              inherit: false,
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          ...currentQuestion.getShuffled().map((e) => Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(onPressed: (() {
                nextQuestion(e);
              }), child: Text(e))))
        ],
      ),
    );
  }
}
