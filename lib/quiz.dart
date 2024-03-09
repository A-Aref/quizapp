import 'package:flutter/material.dart';
import 'package:quizapp/questions.dart';
import 'home.dart';
import 'question.dart';
import 'results.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeWidget;
  List<String> answers=[];

  void setScreen() {
    setState(() {
      activeWidget = Questions(setAnswers);
    });
  }

  void reset() {
    setState(() {
      activeWidget = Questions(setAnswers);
      answers.clear();
    });
  }


  void setAnswers(String e) {
    answers.add(e);

    if(answers.length == questions.length)
    {
      setState(() {
      activeWidget = Result(answers,reset);
    });
    }
  }

  @override
  void initState() {
    super.initState();
    activeWidget = HomePage(setScreen);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.lightBlue,
                Colors.blueAccent,
                Colors.indigoAccent
              ])),
          child: Center(
            child: activeWidget,
          )),
    ));
  }
}
