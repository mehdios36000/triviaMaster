import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:triviamaster/views/home.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class GameOver extends StatefulWidget {
  var score = 0;
  GameOver({Key? key, required this.score}) : super(key: key);

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  @override
  Widget build(BuildContext context) {
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio("assets/audios/gameover.mp3"),
      autoStart: true,
      showNotification: true,
    );
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SvgPicture.asset("assets/images/bg.svg",
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Game Over',
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
                  "Your score is " + widget.score.toString(),
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
                    'Restart',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C2341),
                        fontFamily: 'roboto'),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
