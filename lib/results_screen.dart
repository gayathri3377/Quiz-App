import 'package:flutter/material.dart';
import 'package:quizz/data/quiz_questions.dart';
import 'package:quizz/questions_summary.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  ResultScreen({super.key,required this.choosenAnswers,required this.onRestart});
  List <String>choosenAnswers;
  final void Function() onRestart;

  List<Map<String,Object>> getSummary(){
    final List<Map<String,Object>>summary=[];
    for (var i =0; i<choosenAnswers.length;i++){
      summary.add(
        {
          'question-index':i,
          'question':questions[i].question,
          'correct-answer':questions[i].answers[0],
          'choosen-answer':choosenAnswers[i]
        });
    }
    return summary;
  }
  @override
  Widget build(BuildContext context) {

    final obtainedSummaryData=getSummary();
    final numTotalQuestions=questions.length;

    final numCorrectAnswers=obtainedSummaryData.where((data){
      return data['correct-answer']==data['choosen-answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',style: TextStyle(color: const Color.fromARGB(219, 255, 255, 255),fontSize: 20 ),textAlign: TextAlign.center,),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData: obtainedSummaryData),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                TextButton.icon(
                  onPressed: onRestart,
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(230, 255, 255, 255)
                  ),
                  icon:const Icon(Icons.restart_alt_sharp) ,
                  label:const Text('Restart Quiz') ,
                )
              ],
            )
          ],
        )
      )
    );
  }
}