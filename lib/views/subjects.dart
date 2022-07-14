import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Subjects extends StatefulWidget {
  const Subjects({Key? key}) : super(key: key);

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
        children: <Widget>[
          Container(color: Colors.blue[700]),
          
        
       
          
          SingleChildScrollView(
            
            child: Stack(
              children: <Widget>[ 
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child:IconButton(
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
                            color: Colors.white),
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
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 95, left: 95),
                      child: Card(
                        child: ListTile(
                          title: Text('Science'),
                          //add icon
                          leading: Icon(Icons.science),
                          onTap: () {},
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
                          title: Text('Music'),
                          //add icon
                          leading: Icon(Icons.music_note),
                          onTap: () {},
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
                          title: Text('Film & TV'),
                          //add icon
                          leading: Icon(Icons.tv),
                          onTap: () {},
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
                          title: Text('History'),
                          //add icon
                          leading: Icon(Icons.history_edu),
                          onTap: () {},
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
                          title: Text('Geography'),
                          //add icon
                          leading: Icon(Icons.location_on),
                          onTap: () {},
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
                          title: Text('Sport & Leisure'),
                          //add icon
                          leading: Icon(Icons.sports_football),
                          onTap: () {},
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
                          title: Text('General Knowledge'),
                          //add icon
                          leading: Icon(Icons.public),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ]
              
            ),
          ),
        ],
      ),
    );
    ;
  }
}
