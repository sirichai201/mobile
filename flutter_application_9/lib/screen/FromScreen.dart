import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/model/student.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  Student myStudent = Student();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  // ignore: prefer_final_fields
  CollectionReference _studentCollection =
      FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text('แบบฟรอร์มบันทึกข้อมูล'),
              ),
              body: Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ชื่อ', style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator:
                              RequiredValidator(errorText: "กรุณาป้อนชื่อ"),
                          onSaved: (Value) {
                            myStudent.fname = Value;
                          },
                        ),
                        SizedBox(height: 15),
                        Text('นามสกุล', style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator:
                              RequiredValidator(errorText: "กรุณาป้อนนามสกุล"),
                          onSaved: (Value) {
                            myStudent.lname = Value;
                          },
                        ),
                        SizedBox(height: 15),
                        Text('อีเมล', style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "กรุณาป้อนอีเมล"),
                            EmailValidator(errorText: "อีเมลไม่ถูกต้อง")
                          ]),
                          onSaved: (Value) {
                            myStudent.email = Value;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 15),
                        Text('อุณหภูมิ', style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator:
                              RequiredValidator(errorText: "กรุณาป้อนอุณหภูมิ"),
                          onSaved: (Value) {
                            myStudent.temp = Value;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text('บันทึก'),
                            style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 20)),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                await _studentCollection.add({
                                  'fname': myStudent.fname,
                                  'lname': myStudent.lname,
                                  'email': myStudent.email,
                                  'temp': myStudent.temp,
                                });
                                formKey.currentState?.reset();
                              }
                            },
                          ),
                        )
                      ],
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
