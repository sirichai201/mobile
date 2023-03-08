import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/model/profile.dart';
import 'package:flutter_application_10/screen/welcome.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Scaffold(
          appBar: AppBar(title: Text("Error")),
          body: Center(
            child: Text("${snapshot.error}"),
          ),
        );
      }
      if (snapshot.connectionState == ConnectionState.done) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("อีเมล", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: "กรุณาป้อนอีเมล"),
                          EmailValidator(errorText: "อีเมลไม่ถูกต้อง")
                        ]),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (email) {
                          profile.email = email;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("รหัสผ่าน", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        validator:
                            RequiredValidator(errorText: "กรุณาป้อนรหัสผ่าน"),
                        obscureText: true,
                        onSaved: (password) {
                          profile.password = password;
                        },
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text("ลงชื่อเข้าใช้",
                              style: TextStyle(fontSize: 20)),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: profile.email.toString(),
                                        password: profile.password.toString())
                                    .then((value) {
                                  formKey.currentState!.reset();

                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return WelcomeScreen();
                                  }));
                                });
                              } on FirebaseAuthException catch (e) {
                                Fluttertoast.showToast(
                                    msg: e.message.toString(),
                                    gravity: ToastGravity.CENTER);
                              }
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
