import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key,required this.summaryData});

  final List<Map<String,Object>> summaryData;
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(children: summaryData.map((data){
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                  Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:const Color.fromARGB(255, 33, 2, 119),
                      borderRadius:BorderRadius.circular(100) 
                      ),
                    child: Text(((data['question-index'] as int)+1).toString(),textAlign: TextAlign.center,style: TextStyle(color: const Color.fromARGB(218, 255, 255, 255)),)
                    ),
                  const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 33, 2, 119),),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String,style: const TextStyle(color: Color.fromARGB(215, 255, 255, 255),fontSize: 15)),
                        const SizedBox(height: 5,),
                        
                        Text(data['choosen-answer'] as String,style: const TextStyle(color: Color.fromARGB(255, 249, 133, 241) ,fontSize: 12),),
                        const SizedBox(height: 5,),
                        
                        Text(data['correct-answer'] as String,style: const TextStyle(color: Color.fromARGB(255, 150, 198, 241),fontSize: 12)),
                        const SizedBox(height: 5,),
                      ],
                    ),
                  ),
                )
            ]);
          }
          ).toList()
        ,),
      ),
    );
  }
}