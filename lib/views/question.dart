import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:triviamaster/views/gameover.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';

class Question extends StatefulWidget {
  List<dynamic> data = [];
  var counter = 0;
  String question = "";
  String correctAnswer = "";
  List<dynamic> allAnswers = [];
  String category = "";
  var score = 0;
  Question(
      {Key? key,
      required this.counter,
      required this.data,
      required this.score,
      required this.category})
      : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  //function to change the time

  @override
  Widget build(BuildContext context) {
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio("assets/audios/questions.mp3"),
      autoStart: true,
      loopMode: LoopMode.single,
      showNotification: true,
    );
    if (widget.counter == 50) {
      var url =
          "https://the-trivia-api.com/api/questions?categories=${widget.category}&limit=50";
      http.get(Uri.parse(url)).then((response) {
        widget.data = json.decode(response.body);
      });
      widget.counter = 0;
    }
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
        SvgPicture.asset("assets/images/bg.svg",
            fit: BoxFit.fill, height: double.infinity, width: double.infinity),
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
                      color: Colors.white,
                      fontFamily: 'roboto'),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: LinearPercentIndicator(
                lineHeight: 10.0,
                percent: 1.0,
                animation: true,
                animationDuration: 20000,
                backgroundColor: Colors.white,
                progressColor: Colors.blueGrey,
                onAnimationEnd: () {
                  assetsAudioPlayer.stop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameOver(
                        score: widget.score,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),

            //4 cards for the options
            SingleChildScrollView(
              child: Container(
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
                                color: Colors.black,
                                fontFamily: 'roboto'),
                          ),
                          onTap: () {
                            widget.counter++;
                            //if the answer is correct
                            if (widget.allAnswers[0] == widget.correctAnswer) {
                              assetsAudioPlayer.open(
                                Audio("assets/audios/correct.mp3"),
                                autoStart: true,
                                showNotification: true,
                              );
                              //stop the future delay function
                              widget.score = widget.score + 10;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Question(
                                        counter: widget.counter,
                                        data: widget.data,
                                        score: widget.score,
                                        category: widget.category)),
                              );
                            } else {
                              //stop the audio player
                              assetsAudioPlayer.stop();
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
                                color: Colors.black,
                                fontFamily: 'roboto'),
                          ),
                          onTap: () {
                            widget.counter++;
                            //if the answer is correct
                            if (widget.allAnswers[1] == widget.correctAnswer) {
                              assetsAudioPlayer.open(
                                Audio("assets/audios/correct.mp3"),
                                autoStart: true,
                                showNotification: true,
                              );
                              widget.score = widget.score + 10;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Question(
                                        counter: widget.counter,
                                        data: widget.data,
                                        score: widget.score,
                                        category: widget.category)),
                              );
                            } else {
                              //stop the audio player
                              assetsAudioPlayer.stop();
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
                                color: Colors.black,
                                fontFamily: 'roboto'),
                          ),
                          onTap: () {
                            widget.counter++;
                            //if the answer is correct
                            if (widget.allAnswers[2] == widget.correctAnswer) {
                              assetsAudioPlayer.open(
                                Audio("assets/audios/correct.mp3"),
                                autoStart: true,
                                showNotification: true,
                              );
                              widget.score = widget.score + 10;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Question(
                                        counter: widget.counter,
                                        data: widget.data,
                                        score: widget.score,
                                        category: widget.category)),
                              );
                            } else {
                              //stop the audio player
                              assetsAudioPlayer.stop();
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
                                color: Colors.black,
                                fontFamily: 'roboto'),
                          ),
                          onTap: () {
                            widget.counter++;
                            //if the answer is correct
                            if (widget.allAnswers[3] == widget.correctAnswer) {
                              assetsAudioPlayer.open(
                                Audio("assets/audios/correct.mp3"),
                                autoStart: true,
                                showNotification: true,
                              );
                              widget.score = widget.score + 10;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Question(
                                        counter: widget.counter,
                                        data: widget.data,
                                        score: widget.score,
                                        category: widget.category)),
                              );
                            } else {
                              //stop the audio player
                              assetsAudioPlayer.stop();
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
            ),
          ],
        ),
      ],
    ));
  }
}
