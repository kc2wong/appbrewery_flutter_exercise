import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(radius: 50.0, backgroundImage: AssetImage('assets/images/gundam_exia.jpg')),
              Text(
                'Kelvin Wong',
                style: TextStyle(fontFamily: 'Pacifico', fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                'SOLUTION ARCHITECT',
                style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.teal[100]),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(color: Colors.teal[100]),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+852 XXXX XXXX',
                    style: TextStyle(color: Colors.teal[900], fontFamily: 'SourceSansPro', fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'kc2wong@hotmail.com',
                    style: TextStyle(color: Colors.teal[900], fontFamily: 'SourceSansPro', fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
