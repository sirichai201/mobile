import 'dart:io';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_application_7/model/transaction.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  String dbName; //ชื่อฐานข้อมูล
  //ถ้า DB ยังไม่ถูกสร้าง => DB จะสร้างให้อัตโนมัติ
  //ถ้าเคยมี DBอยู่แล้ว => จะเปิด DBนั้นขึ้นมา
  TransactionDB({required this.dbName});

  Future<Database> openDatabase() async {
    //หา Directoryของแอป
    Directory appDirectory = await getApplicationSupportDirectory();
    //กำหนดตำแหน่งของฐานข้อมูล
    String dbLocation = join(appDirectory.path, dbName);
    //print(dbLocation);
    //สร้างฐานข้อมูล
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<int> insertData(Transactions statement) async {
    //ฐานข้อมูล => Store
    // transactions.db => expense
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    //json
    var keyID = store.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date.toIso8601String()
    });
    db.close();
    return keyID;
  }

  //ดึงข้อมูล
  Future<List<Transactions>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    List<Transactions> transactionList = [];
    //ดึงข้อมูลทีละรายการ
    for (var record in snapshot) {
      transactionList.add(Transactions(
          title: record["title"].toString(),
          amount: double.parse(record["amount"].toString()),
          date: DateTime.parse(record["date"].toString())));
    }
    return transactionList;
  }
}
