import 'package:flutter/material.dart';
import 'MoneyBox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'My Account Sirichai'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MoneyBox('ยอดคงเหลือ', 5000.55, Colors.lightBlue, 150),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 5,
            ),
            MoneyBox("รายรับ", 7000.678, Colors.green, 150),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 5,
            ),
            MoneyBox("รายจ่าย", 2000, Colors.red, 150),
          ],
        ),
      ),
    );
  }
}
