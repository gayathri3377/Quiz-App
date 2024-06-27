import 'package:flutter/material.dart';
import 'package:quizz/data/quiz_questions.dart';
import 'package:quizz/questions_page.dart';
import 'package:quizz/results_screen.dart';
import 'package:quizz/srart_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}
class _QuizState extends State<Quiz> {
  var activeScreen='start-screen';
  List<String>selectedAnswers=[];

  void changeScreen(){
    setState(() {
      activeScreen = 'question-screen';
    });
  }
  void selectedAnswersAdd(String answer){
      selectedAnswers.add(answer);
      setState((){
        if (selectedAnswers.length ==questions.length){
          activeScreen='result-screen';
      }});
    }
    void restart(){
      setState(() {
        selectedAnswers=[];
        activeScreen='question-screen';
      });
    }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget =StartScreen(changeScreen);
    if (activeScreen=='question-screen'){
      screenWidget=QuestionsPage(
      OnSelectAnswer: selectedAnswersAdd);
    }
    if (activeScreen=='result-screen'){
      screenWidget=ResultScreen(
      choosenAnswers: selectedAnswers,
      onRestart: restart,);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home:Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: 
          [ 
            Colors.blue,
            Colors.purple,
            Colors.red
          ],
          begin: Alignment.topLeft,
          end:Alignment.bottomRight

          )
        ),
        child: screenWidget
      )
     )
    );
  }
}