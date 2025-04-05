import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// This is a simple xylophone app that plays different notes when buttons are pressed.
// The app uses the audioplayers package to handle audio playback.
// The app consists of a series of buttons, each corresponding to a musical note.
// When a button is pressed, the corresponding note is played using the AudioPlayer class.
// The app is designed to be simple and easy to use, making it a great tool for learning about musical notes and sounds.

//For the correct functioning of this app do not forget to add the following permissions in the
//AndroidManifest.xml file located at //android/app/src/main/AndroidManifest.xml
//    <uses-permission android:name="android.permission.INTERNET" />
//    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
//    <uses-permission android:name="android.permission.WAKE_LOCK" />

final player = AudioPlayer();

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNumber) async {
    player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey(int soundNumber, Color color, String text) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () {
          playSound(soundNumber);
        },
        child: Text(text, style: TextStyle(color: Colors.black)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(1, Colors.red, 'Do'),
              buildKey(2, Colors.orange, 'Re'),
              buildKey(3, Colors.yellow, 'Mi'),
              buildKey(4, Colors.green, 'Fa'),
              buildKey(5, Colors.teal, 'Sol'),
              buildKey(6, Colors.blue, 'La'),
              buildKey(7, Colors.purple, 'Si'),
            ],
          ),
        ),
      ),
    );
  }
}
