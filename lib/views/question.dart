import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:triviamaster/views/gameover.dart';

class Question extends StatefulWidget {
  List<dynamic> data = [];
  var counter = 0;
  String question = "";
  String correctAnswer = "";
  List<dynamic> allAnswers = [];
  var score = 0;
  Question(
      {Key? key,
      required this.counter,
      required this.data,
      required this.score})
      : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    if (widget.question == "") {
      widget.question = widget.data[widget.counter]['question'];
      widget.correctAnswer = widget.data[widget.counter]['correctAnswer'];
      widget.allAnswers = widget.data[widget.counter]['incorrectAnswers'];
      widget.allAnswers.add(widget.correctAnswer);
      widget.allAnswers.shuffle();
    }
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(color: Colors.blue[700]),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  widget.question,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            //4 cards for the options
            Container(
              margin: EdgeInsets.only(left: 95, right: 95),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          widget.allAnswers[0],
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[700]),
                        ),
                        onTap: () {
                          widget.counter++;
                          //if the answer is correct
                          if (widget.allAnswers[0] == widget.correctAnswer) {
                            widget.score = widget.score + 10;
                            print(widget.score);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Question(
                                      counter: widget.counter,
                                      data: widget.data,
                                      score: widget.score)),
                            );
                          } else {
                            var finalScore = widget.score;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GameOver(score: finalScore)),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          widget.allAnswers[1],
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[700]),
                        ),
                        onTap: () {
                          widget.counter++;
                          //if the answer is correct
                          if (widget.allAnswers[1] == widget.correctAnswer) {
                            widget.score = widget.score + 10;
                            print(widget.score);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Question(
                                      counter: widget.counter,
                                      data: widget.data,
                                      score: widget.score)),
                            );
                          } else {
                            var finalScore = widget.score;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GameOver(score: finalScore)),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          widget.allAnswers[2],
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[700]),
                        ),
                        onTap: () {
                          widget.counter++;
                          //if the answer is correct
                          if (widget.allAnswers[2] == widget.correctAnswer) {
                            widget.score = widget.score + 10;
                            print(widget.score);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Question(
                                      counter: widget.counter,
                                      data: widget.data,
                                      score: widget.score)),
                            );
                          } else {
                            var finalScore = widget.score;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GameOver(score: finalScore)),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          widget.allAnswers[3],
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[700]),
                        ),
                        onTap: () {
                          widget.counter++;
                          //if the answer is correct
                          if (widget.allAnswers[3] == widget.correctAnswer) {
                            widget.score = widget.score + 10;
                            print(widget.score);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Question(
                                      counter: widget.counter,
                                      data: widget.data,
                                      score: widget.score)),
                            );
                          } else {
                            var finalScore = widget.score;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GameOver(score: finalScore)),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
