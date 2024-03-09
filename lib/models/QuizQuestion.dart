// TODO Implement this library.

class QuizQuestion {
  const QuizQuestion(this.question,this.answers);
  final String question;
  final List<String> answers;

  List<String> getShuffled(){
    List<String> shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }

}