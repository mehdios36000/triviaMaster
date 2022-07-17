// ignore_for_file: deprecated_member_use

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:triviamaster/views/subjects.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio("assets/audios/background.wav"),
      autoStart: true,
      loopMode: LoopMode.single,
      showNotification: true,
    );
    return Scaffold(
        body: Stack(
      children: <Widget>[
        //fill the screen with the bg whole screen
        SvgPicture.asset("assets/images/bg.svg",
            fit: BoxFit.fill, height: double.infinity, width: double.infinity),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Trivia Master',
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'roboto'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Welcome to Trivia Master',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'roboto'),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.blueGrey,
                child: Text(
                  'Start',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2341),
                      fontFamily: 'roboto'),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Subjects(audio: assetsAudioPlayer)),
                  );
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}
