import 'package:flutter/material.dart';
import 'new_account.dart';
import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Authentication'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text(
                  'New User Account',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'NewAccount');
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'Login');
                },
              ),
              ElevatedButton(
                child: Text(
                  'My Cloud Firestore',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'Firestore');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
