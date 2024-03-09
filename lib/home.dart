import 'package:flutter/material.dart';

class  HomePage extends StatelessWidget {
  HomePage(this.setScreen ,{ Key? key }) : super(key: key);

  void Function() setScreen;

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Colors.lightBlue,Colors.blueAccent,Colors.indigoAccent])
      ),
      child: Center( 
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/assets/images/quiz-logo.png',height: 300),
          const SizedBox(height:50),
          const Text("Flutter Quiz",style: TextStyle(color: Colors.orangeAccent,inherit: false,fontSize: 40),),
          const SizedBox(height:25),
          ElevatedButton.icon(onPressed: setScreen,icon:const Icon(Icons.arrow_right), label: const Text("Start Quiz",style: TextStyle(color: Colors.limeAccent,))),
        ],
      ),
      )
    );
  }
}