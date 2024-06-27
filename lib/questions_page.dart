
import 'package:flutter/material.dart';
import 'package:quizz/answer_button.dart';
import 'package:quizz/data/quiz_questions.dart';

// ignore: must_be_immutable
class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key,required this.OnSelectAnswer});
  final void Function(String answer)OnSelectAnswer;
  @override
  State<QuestionsPage> createState() => _QuestionsState();
}

class _QuestionsState extends State<QuestionsPage> {
  var currentQuestionIndex=0;
  
  void QuestionChange(String SelectedAnswer){
    widget.OnSelectAnswer(SelectedAnswer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion=questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: [
          Text(currentQuestion.question,textAlign: TextAlign.center,style: const TextStyle(color: Color.fromARGB(214, 255, 255, 255),fontSize: 20,),),
          const SizedBox(height: 30,),
          
          ...currentQuestion.getSuffledList().map((answers){
            return AnswerButton(answerText: answers, OnTap:(){
              QuestionChange(answers);
            });
          }),
        ],),
      ),
    );
  }
}