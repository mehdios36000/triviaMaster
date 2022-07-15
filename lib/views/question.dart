import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
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
                    child: 
                      Text(
                        'What is the capital of Morocco?',
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
                              'Rabat',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[700]),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Question()),
                              );
                            },
                          ),
                        ),
                        
                      ),
                      Container(
                        child: Card(
                          color: Colors.white,
                          
                          child: ListTile(
                            title: Text(
                              'Casablanca',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[700]),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Question()),
                              );
                            },
                          ),
                        ),
                        
                        
                      ),
                      Container(
                        child: Card(
                          color: Colors.white,
                          
                          child: ListTile(
                            title: Text(
                              'Marrakech',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[700]),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Question()),
                              );
                            },
                          ),
                        ),
                        
                      ),
                      Container(
                        child: Card(
                          color: Colors.white,
                          
                          child: ListTile(
                            title: Text(
                              'Ifrane',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[700]),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Question()),
                              );
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
        
        
        
      )
    );
    
  }
}