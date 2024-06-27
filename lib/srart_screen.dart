import 'package:flutter/material.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Quiz.png',
            height: 200,
          ),
          const SizedBox(height: 30,),
          const Text('Welome to Quiz App!',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30,),),
          const SizedBox(height: 20,),
          OutlinedButton.icon(
            onPressed: (){
              startQuiz();
            },
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white,), 
          icon: const Icon(Icons.arrow_right_alt),
          label:const Text('Start'))
          ]
        ),
        );
  }
}