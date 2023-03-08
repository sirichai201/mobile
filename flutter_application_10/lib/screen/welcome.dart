import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/screen/home.dart';
import 'package:firebase_core/firebase_core.dart';

class WelcomeScreen extends StatelessWidget {
  //const WelcomeScreen({super.key});
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Column(
            children: [
              Text(
                "อีเมลของคุณคือ" + auth.currentUser!.email.toString(),
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                child: Text("ออกจากระบบ"),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ));
                },
              )
            ],
          )),
        ));
  }
}
