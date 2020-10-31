import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_7/managers/question_manager.dart';
import 'package:lesson_7/models/question_data.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<QuestionData> questions = [];
  List<String> answers = ['', '', '', '', '', ''];
  List<bool> variantButtonsVisibility = [];
  List<bool> answerButtonsVisibility = [];

  QuestionManager manager;

  @override
  void initState() {
    super.initState();
    getquestion();
    manager = QuestionManager(questions);
    setViewVisibility();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.red, Colors.blue, Colors.amber],
              ),
            ),
            margin: EdgeInsets.only(top: 25),
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: GestureDetector(
                    child: Icon(Icons.arrow_back),
                    onTap: () {
                      print("Back press");
                    },
                  ),
                  color: Colors.white,
                  height: 56,
                  width: 56,
                  margin: EdgeInsets.only(right: 8, top: 4, bottom: 4),
                ),
                Text(
                  "1",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      Container(
                        child: SvgPicture.asset('assets/dollar.svg'),
                        width: 30,
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text(
                          "1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Image.asset(manager.getQuestion()),
                          margin: EdgeInsets.all(8),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Image.asset(manager.getQuestion()),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Image.asset(manager.getQuestion()),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Image.asset(manager.getQuestion()),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: answerButtonsVisibility[0],
                  child: Container(
                    margin: EdgeInsets.only(right: 4),
                    width: 45,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {
                        answerButtonClick(0);
                      },
                      child: Text(answers[0]),
                    ),
                  ),
                ),
                Visibility(
                  visible: answerButtonsVisibility[1],
                  child: Container(
                    margin: EdgeInsets.only(right: 4),
                    width: 45,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {
                        answerButtonClick(1);
                      },
                      child: Text(answers[1]),
                    ),
                  ),
                ),
                Visibility(
                  visible: answerButtonsVisibility[2],
                  child: Container(
                    margin: EdgeInsets.only(right: 4),
                    width: 45,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {
                        answerButtonClick(2);
                      },
                      child: Text(answers[2]),
                    ),
                  ),
                ),
                Visibility(
                  visible: answerButtonsVisibility[3],
                  child: Container(
                    margin: EdgeInsets.only(right: 4),
                    width: 45,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {
                        answerButtonClick(3);
                      },
                      child: Text(answers[3]),
                    ),
                  ),
                ),
                Visibility(
                  visible: answerButtonsVisibility[4],
                  child: Container(
                    margin: EdgeInsets.only(right: 4),
                    width: 45,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {
                        answerButtonClick(4);
                      },
                      child: Text(answers[4]),
                    ),
                  ),
                ),
                Visibility(
                  visible: answerButtonsVisibility[5],
                  child: Container(
                    margin: EdgeInsets.only(right: 4),
                    width: 45,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {
                        answerButtonClick(5);
                      },
                      child: Text(answers[5]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 5,
              children: [
                Visibility(
                  visible: variantButtonsVisibility[0],
                  child: RaisedButton(
                    onPressed: () {
                      variantButtonClick(0);
                    },
                    child: Text(manager.getVariant()[0]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[1],
                  child: RaisedButton(
                    onPressed: () {
                      variantButtonClick(1);
                    },
                    child: Text(manager.getVariant()[1]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[2],
                  child: RaisedButton(
                    onPressed: () {
                      variantButtonClick(2);
                    },
                    child: Text(manager.getVariant()[2]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[3],
                  child: RaisedButton(
                    onPressed: () {
                      variantButtonClick(3);
                    },
                    child: Text(manager.getVariant()[3]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[4],
                  child: RaisedButton(
                    onPressed: () {
                      variantButtonClick(4);
                    },
                    child: Text(manager.getVariant()[4]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[5],
                  child: RaisedButton(
                    onPressed: () {
                      variantButtonClick(5);
                    },
                    child: Text(manager.getVariant()[5]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[6],
                  child: RaisedButton(
                    onPressed: () {
                      variantButtonClick(6);
                    },
                    child: Text(manager.getVariant()[6]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[7],
                  child: RaisedButton(
                    onPressed: () {
                      variantButtonClick(7);
                    },
                    child: Text(manager.getVariant()[7]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[8],
                  child: RaisedButton(
                    onPressed: () {
                      variantButtonClick(8);
                    },
                    child: Text(manager.getVariant()[8]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[9],
                  child: RaisedButton(
                    onPressed: () {
                      variantButtonClick(9);
                    },
                    child: Text(manager.getVariant()[9]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getquestion() {
    questions.add(QuestionData('assets/yoda.jpeg', 'yoda', 'rpyiaeodqo'));
    questions.add(QuestionData('assets/apple_1.png', 'iphone', 'rphikeonqp'));
    questions.add(QuestionData('assets/apple_2.jpg', 'apple', 'eacplepoph'));
  }

  void setViewVisibility() {
    variantButtonsVisibility.clear();
    answerButtonsVisibility.clear();

    for (int i = 0; i < 10; i++) {
      variantButtonsVisibility.add(true);
    }

    for (int i = 0; i < 6; i++) {
      answers[i] = '';
      if (manager.getAnswerLength() > i) {
        answerButtonsVisibility.add(true);
      } else {
        answerButtonsVisibility.add(false);
      }
    }
  }

  void answerButtonClick(int i) {
    for (int j = 0; j < 10; j++) {
      if (variantButtonsVisibility[j] == false &&
          manager.getVariant()[j] == answers[i]) {
        setState(() {
          variantButtonsVisibility[j] = true;
          answers[i] = '';
        });
      }
    }
  }

  void variantButtonClick(int i) {
    for (int j = 0; j < manager.getAnswerLength(); j++) {
      if (answers[j].isEmpty) {
        setState(() {
          answers[j] = manager.getVariant()[i];
          variantButtonsVisibility[i] = false;
          checkAnswer();
        });
        break;
      }
    }
  }

  void checkAnswer() {
    String answer = '';
    answers.forEach((element) {
      if (element.isNotEmpty) answer += element;
    });
    if(manager.check(answer)){
      setState(() {
        if(manager.nextQuestion()){
          setViewVisibility();
        }else{
          AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Congratulation',
            desc: 'You are win!!!!',
            btnOkOnPress: () {

            },
          )..show();
        }
      });
    }
  }
}
