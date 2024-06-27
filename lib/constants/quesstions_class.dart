
class QuizQuestion{
  QuizQuestion( this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String>getSuffledList(){

    final answersList=List.of(answers);
    answersList.shuffle();
    return answersList;

  }
}

