import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skype/Screens/Home.dart';
import 'package:skype/Screens/Login.dart';
import 'package:skype/resources/repository/FirebaseRepository.dart';

main(List<String> args) {
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  FirebaseRepository _firebaseRepository = FirebaseRepository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Skype",
      debugShowCheckedModeBanner: false,
      home: Container(
        child: FutureBuilder(
            future: _firebaseRepository.getCurrentUser(),
            builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
              if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return LoginScreen();
              }
            }),
      ),
    );
  }
}
