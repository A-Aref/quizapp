

import 'package:flutter/material.dart';
import 'package:quizapp/questions.dart';

class Result extends StatefulWidget {
  Result(this.answers,this.setScreen,{ Key? key }) : super(key: key);
  List<String> answers;
  void Function() setScreen;


  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  

   List<Map<String, Object>> getSummary(){
    final List<Map<String,Object>> summary = [];

    for (var i = 0; i < widget.answers.length; i++) {
      
      summary.add({
        'question_index': i+1,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'your_answer': widget.answers[i]
      });
    }
    return summary;
  }

  int getCount(){
    int count=0;
    for (var i = 0; i < widget.answers.length; i++) {
      if(questions[i].answers[0]==widget.answers[i])
      {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Results",style: TextStyle(
              color: Colors.amber,
              inherit: false,
              fontSize: 40)),
        const SizedBox(height: 10,),
        Text(getCount().toString()+" of "+widget.answers.length.toString(),style: const TextStyle(
              color: Colors.amber,
              inherit: false,
              fontSize: 20)),
        const SizedBox(height: 20,),
        ...getSummary().map((e) {
          return Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [CircleAvatar(child:Text(e['question_index'].toString()),backgroundColor: e['your_answer']==e['correct_answer']?Colors.greenAccent:Colors.red,),
                  const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                  Text(e['question'].toString(),style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                  Text("Your answer: " + e['your_answer'].toString(),style: const TextStyle(color: Colors.redAccent)),
                  Text("Correct answer: "+ e['correct_answer'].toString(),style: const TextStyle(color: Color.fromARGB(255, 195, 239, 108)),),
                  ]),
                )]),
                const SizedBox(height: 20,)
              ],
            ),
          );
        },),
        TextButton(onPressed: widget.setScreen, child: const Text("Restart Quiz",style:  TextStyle(color: Color.fromARGB(255, 80, 234, 9))))
      ],
    );
  }
}