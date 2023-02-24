import 'package:flutter/material.dart';
import 'package:flutter_application_7/model/transaction.dart';
import 'package:flutter_application_7/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  //controller
  final titleConttroller = TextEditingController(); //รับค่าชื่อรายการ
  final amountConttroller = TextEditingController(); //รับตัวเลขจำนวนเงิน

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
            child: Column(children: [
              TextFormField(
                decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                autofocus: true,
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
                      Transaction statement = Transaction(
                          title: Title,
                          amount: double.parse(amount),
                          date: DateTime.now());
                      //เรียกprovider
                      var provider = Provider.of<TransactionProvider>(context,
                          listen: false);
                      provider.addTransaction(statement);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('บันทึก'),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                  )),
            ]),
          )),
    );
  }
}
