// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';

import 'package:flutter_application_7/model/transaction.dart';
import 'package:flutter_application_7/providers/transaction_provider.dart';
import 'package:flutter_application_7/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  //controller
  final titleConttroller = TextEditingController(); //รับค่าชื่อรายการ
  final amountConttroller = TextEditingController();

  FormScreen({super.key}); //รับตัวเลขจำนวนเงิน

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เพิ่มข้อมูล"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextFormField(
                decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                autofocus: false,
                controller: titleConttroller,
                validator: (String? str) {
                  if (str == '') return "กรุณาป้อนชื่อรายการ";
                  return null;
                },
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                keyboardType: TextInputType.number,
                controller: amountConttroller,
                validator: (String? str) {
                  if (str!.isEmpty) return "กรุณาป้อนจำนวนเงิน";
                  if (double.parse(str.toString()) <= 0)
                    return "กรุณาป้อนตัวเลขมากกว่า 0";
                  return null;
                },
              ),
              TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var Title = titleConttroller.text;
                      var amount = amountConttroller.text;
                      //print(title);
                      //print(amount);
                      //เตรียมข้อมูล
                      Transactions statement = Transactions(
                          title: Title,
                          amount: double.parse(amount),
                          date: DateTime.now());
                      //เรียกprovider
                      var provider = Provider.of<TransactionProvider>(context,
                          listen: false);
                      provider.addTransaction(statement);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) {
                                return MyHomePage(
                                  title: 'แอพรายจ่าย',
                                );
                              }));
                    }
                  },
                  // ignore: sort_child_properties_last
                  child: Text('บันทึก'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 20),
                    backgroundColor: Colors.green,
                  )),
            ]),
          )),
    );
  }
}
