import 'package:flutter/foundation.dart';
import 'package:flutter_application_7/database/transaction_db.dart';
import 'package:flutter_application_7/model/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];
  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transaction.db");
    //บันทึกข้อมูล(insert)
    await db.insertData(statement);

    //ดึงข้อมูลมาแสดงผล(select)
    transactions = await db.loadAllData();
//แจ้งเตือน Consumer
    notifyListeners();
  }

  void initData() async {
    var db = TransactionDB(dbName: "transaction.db");
    //ดึงข้อมูลมาแสดงผล(select)
    transactions = await db.loadAllData();
    notifyListeners();
  }
}
