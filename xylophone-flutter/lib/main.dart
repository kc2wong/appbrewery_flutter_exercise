import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final player = AudioCache();
    final colors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.teal, Colors.blue, Colors.purple];
    final buttons = colors
        .asMap()
        .map((index, c) => MapEntry(
              index,
              Expanded(
                child: FlatButton(
                  color: c,
                  onPressed: () {
                    player.play('sounds/note${index + 1}.wav');
                  },
                ),
              ),
            ))
        .values
        .toList();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: buttons),
        ),
      ),
    );
  }
}
