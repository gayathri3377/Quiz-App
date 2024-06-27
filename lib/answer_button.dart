import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
    {
      required this.answerText,
      required this.OnTap,
      super.key
      }
    );

  final String answerText;
  final void Function() OnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: (){
          OnTap();
        }, 
        style:ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          
          backgroundColor: const Color.fromARGB(255, 33, 2, 119),
          foregroundColor: const Color.fromARGB(226, 255, 255, 255),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        ) ,
        child: Text(answerText,textAlign: TextAlign.center,)),
    );
  }
}