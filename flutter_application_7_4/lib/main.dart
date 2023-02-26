// ignore: unused_import
// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';

import 'package:flutter_application_7/providers/transaction_provider.dart';
import 'package:flutter_application_7/screens/form_screen.dart';
import 'package:flutter_application_7/screens/home_screen.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:flutter_application_7/model/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Project',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // ignore: prefer_const_constructors
        home: MyHomePage(title: 'แอปรายจ่าย'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: TabBarView(
          children: [
            HomeScreen(),
            FormScreen(),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.list),
              text: "รายการ",
            ),
            Tab(icon: Icon(Icons.add), text: "เพิ่มข้อมูล")
          ],
        ),
      ),
    );
  }
}
