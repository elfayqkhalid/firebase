import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Service extends StatefulWidget {
  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference databse =
      FirebaseDatabase.instance.reference().child("My_Service");

  sendData() {
    databse.push().set(
      {'Name': 'Rachid', 'Country': 'Maroc', 'City': 'Laayoune'},
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Android ATC Services'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                auth.signOut();
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  child: Text(
                    'Welcome to Android ATC',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(child: Text("Save"), onPressed: () => sendData()),
            ],
          ),
        ),
      ),
    );
  }
}
