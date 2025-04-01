import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'Martin Abreu',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(color: Colors.teal.shade100),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25,
                  color: Colors.teal.shade100,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              Text(
                'CYBERSECURITY ANALYST',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25,
                  color: Colors.teal.shade100,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(color: Colors.teal.shade100),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListTile(
                  leading: Icon(Icons.phone, size: 28, color: Colors.teal),
                  title: Text(
                    '          +598 98 221 795',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.teal.shade900,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListTile(
                  leading: Icon(Icons.mail, size: 28, color: Colors.teal),
                  title: Text(
                    'mab.devsolutions@gmail.com',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.teal.shade900,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
