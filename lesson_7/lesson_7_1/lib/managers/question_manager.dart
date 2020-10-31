import 'package:lesson_7/models/question_data.dart';

class QuestionManager {
  List<QuestionData> data;
  int position = 0;

  QuestionManager(this.data);

  QuestionData getQuestionData() {
    return data[position];
  }

  String getVariant() {
    return getQuestionData().variant;
  }

  String getAnswer() {
    return getQuestionData().answer;
  }

  String getQuestion() {
    return getQuestionData().imgUrl;
  }

  int getAnswerLength() {
    return getQuestionData().answer.length;
  }

  bool check(String answer) {
      return getQuestionData().answer.trim().toLowerCase()==answer.trim().toLowerCase();
  }
  bool nextQuestion(){
    if(position<getQuestionCount()-1){
      position++;
      return true;
    }
    return false;
  }

  int getQuestionCount(){
    return data.length;
  }
}
