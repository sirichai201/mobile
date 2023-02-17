import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เพิ่มข้อมูล")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(children: [
            TextField(
              decoration: new InputDecoration(labelText: "ชื่อรายการ"),
          autocorrect: true,
            ),
            TextField(
              decoration: new InputDecoration(labelText: "จำนวนเงิน"),
          keyboardType: TextInputType.number,
            ),
            TextButton(
              onPressed: () {
              Navigator.pop(context);
            },
            child: Text('บันทึก'),
          style: TextButton.styleFrom(
            textStyle: TextStyle(fontSize: 20),
            primary: Colors.white,
            backgroundColor: Colors.green,
          )          
            ),
          ]),
        )
      ),
      );
  }
}