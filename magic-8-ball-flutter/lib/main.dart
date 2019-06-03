import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: new BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Ask me Anything'),
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.blue,
      body: new Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int _ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: new Image.asset(
          'assets/images/ball$_ballNumber.png',
        ),
        onPressed: () {
          setState(() {
            _ballNumber = (new Random()).nextInt(5) + 1;
            print('I got clicked, ballNumber = $_ballNumber');
          });
        },
      ),
    );
  }
}
