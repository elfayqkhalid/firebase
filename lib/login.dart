import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'new_account.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override

  // sign user in method
  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text.trim(),
        password: passwordController.text.trim());
  }

  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      '_Login',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
// **************** User Name ****************
                  Row(
                    children: [
                      Text(
                        'Email Address:',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      SizedBox(
                        width: 220.0,
                        child: TextField(
                          controller: usernameController,
                          onChanged: (value) {},
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          autocorrect: false,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            hintText: 'Your Email',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
// **************** Password ****************
                  Row(
                    children: [
                      Text(
                        'Password:      ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      SizedBox(
                        width: 220.0,
                        child: TextField(
                          controller: passwordController,
                          onChanged: (value) {},
//obscureText: true,
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                          textInputAction: TextInputAction.done,
                          autocorrect: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
// ************* Login Button **********
                  Center(
                    child: Container(
                      width: 100,
                      child: ElevatedButton(
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          signUserIn();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
