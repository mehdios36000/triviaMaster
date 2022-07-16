import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:triviamaster/views/question.dart';
import 'package:http/http.dart' as http;

class Subjects extends StatefulWidget {
  final audio;
  const Subjects({Key? key, required this.audio}) : super(key: key);

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SvgPicture.asset("assets/images/bg.svg",
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity),
          SingleChildScrollView(
            child: Stack(children: <Widget>[
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
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Text(
                      'Subjects',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'Select a subject to start',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                           fontFamily: 'Roboto'),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 95, left: 95),
                    child: Card(
                      child: ListTile(
                        title: Text('Science',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Roboto')),
                        //add icon
                        leading: Icon(Icons.science),
                        onTap: () async {
                          widget.audio.stop();

                          var url =
                              "https://the-trivia-api.com/api/questions?categories=science&limit=50";
                          var response = await http.get(Uri.parse(url));
                          var category="science";
                          List<dynamic> data = json.decode(response.body);
                          var counter = 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Question(
                                    counter: counter, data: data, score: 0,category:category)),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 95, left: 95),
                    child: Card(
                      child: ListTile(
                        title: Text('Music',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Roboto')),
                        //add icon
                        leading: Icon(Icons.music_note),
                        onTap: () async {
                          widget.audio.stop();
                          var url =
                              "https://the-trivia-api.com/api/questions?categories=music&limit=50";
                          var response = await http.get(Uri.parse(url));
                          var category="music";
                          List<dynamic> data = json.decode(response.body);
                          var counter = 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Question(
                                    counter: counter, data: data, score: 0,category:category)),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 95, left: 95),
                    child: Card(
                      child: ListTile(
                        title: Text('Film & TV',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Roboto')),
                        //add icon
                        leading: Icon(Icons.tv),
                        onTap: () async {
                          widget.audio.stop();
                          var url =
                              "https://the-trivia-api.com/api/questions?categories=film_and_tv&limit=50";
                          var response = await http.get(Uri.parse(url));
                          var category="film_and_tv";
                          List<dynamic> data = json.decode(response.body);
                          var counter = 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Question(
                                    counter: counter, data: data, score: 0,category:category)),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 95, left: 95),
                    child: Card(
                      child: ListTile(
                        title: Text('History',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Roboto')),
                        //add icon
                        leading: Icon(Icons.history_edu),
                        onTap: () async {
                          widget.audio.stop();
                          var url =
                              "https://the-trivia-api.com/api/questions?categories=history&limit=50";
                          var response = await http.get(Uri.parse(url));
                          var category="history";
                          List<dynamic> data = json.decode(response.body);
                          var counter = 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Question(
                                    counter: counter, data: data, score: 0,category:category)),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 95, left: 95),
                    child: Card(
                      child: ListTile(
                        title: Text('Geography',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Roboto')),
                        //add icon
                        leading: Icon(Icons.location_on),
                        onTap: () async {
                          widget.audio.stop();
                          var url =
                              "https://the-trivia-api.com/api/questions?categories=geography&limit=50";
                          var response = await http.get(Uri.parse(url));
                          var category="geography";
                          List<dynamic> data = json.decode(response.body);
                          var counter = 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Question(
                                    counter: counter, data: data, score: 0,category:category)),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 95, left: 95),
                    child: Card(
                      child: ListTile(
                        title: Text('Sport & Leisure',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Roboto')),
                        //add icon
                        leading: Icon(Icons.sports_football),
                        onTap: () async {
                          widget.audio.stop();
                          var url =
                              "https://the-trivia-api.com/api/questions?categories=sport_and_leisure&limit=50";
                          var response = await http.get(Uri.parse(url));
                          var category="sport_and_leisure";
                          List<dynamic> data = json.decode(response.body);
                          var counter = 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Question(
                                    counter: counter, data: data, score: 0,category:category)),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 95, left: 95),
                    child: Card(
                      child: ListTile(
                        title: Text('General Knowledge',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Roboto')),
                        //add icon
                        leading: Icon(Icons.public),
                        onTap: () async {
                          widget.audio.stop();
                          var url =
                              "https://the-trivia-api.com/api/questions?categories=general_knowledge&limit=50";
                          var response = await http.get(Uri.parse(url));
                          var category="general_knowledge";
                          List<dynamic> data = json.decode(response.body);
                          var counter = 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Question(
                                    counter: counter, data: data, score: 0,category:category)),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
    ;
  }
}
