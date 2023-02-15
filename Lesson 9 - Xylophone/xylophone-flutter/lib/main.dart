import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound(int fileName) async {
    final player = AudioPlayer();
    await player.setSource(AssetSource("note$fileName.wav"));
    await player.setVolume(0.6);
    player.resume();
  }

  Expanded buildKey(Color color, int sound) {
    return Expanded(
      child: TextButton(
          onPressed: () {
            playSound(sound);
          },
          child: Container(
            decoration: BoxDecoration(color: color),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    AudioPlayer.global.changeLogLevel(LogLevel.info);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(Colors.red, 1),
              buildKey(Colors.orange, 2),
              buildKey(Colors.yellow, 3),
              buildKey(Colors.green, 4),
              buildKey(Colors.teal, 5),
              buildKey(Colors.blue, 6),
              buildKey(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
