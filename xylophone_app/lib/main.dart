import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () async {
                  await player.play(AssetSource('note1.wav'));
                },
                child: Text('Do', style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () async {
                  await player.play(AssetSource('note2.wav'));
                },
                child: Text('Re', style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.yellow),
                onPressed: () async {
                  await player.play(AssetSource('note3.wav'));
                },
                child: Text('Mi', style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () async {
                  await player.play(AssetSource('note4.wav'));
                },
                child: Text('Fa', style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 47, 117, 49),
                ),
                onPressed: () async {
                  await player.play(AssetSource('note5.wav'));
                },
                child: Text('Sol', style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () async {
                  await player.play(AssetSource('note6.wav'));
                },
                child: Text('La', style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () async {
                  await player.play(AssetSource('note7.wav'));
                },
                child: Text('Si', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
