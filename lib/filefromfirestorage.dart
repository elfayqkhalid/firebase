import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'database_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Firebase Image"),
        ),
        body: FutureBuilder(
          future: FireStoreDataBase().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text(
                "Something went wrong",
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return Image.network(
                snapshot.data.toString(),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
