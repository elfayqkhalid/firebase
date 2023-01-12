import 'package:firebase/database_manager.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyCloud extends StatefulWidget {
  @override
  _MyCloudState createState() => _MyCloudState();
}

class _MyCloudState extends State<MyCloud> {
  List<Widget> dataListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.documents.map<Widget>((document) {
      return ListTile(
        title: Text(document["Name"]),
        subtitle: Text(document["City"]),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Cloud Firestore'),
        ),
        body: Container(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('customers').snapshots(),
            builder: (context, snapshot) {
              return ListView(
                //dataListWidget(snapshot) to display your data in the ListView widget
                children: dataListWidget(snapshot),
              );
            },
          ),
        ),
      ),
    );
  }
}
