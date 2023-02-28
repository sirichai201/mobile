import 'package:flutter/material.dart';
import 'package:flutter_application_9/screen/FromScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(children: [
          FormScreen(),
          Container(),
        ]),
        backgroundColor: Colors.greenAccent,
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              text: "บันทึกคะแนน",
            ),
            Tab(
              text: "รายชื่อนักเรียน",
            )
          ],
        ),
      ),
    );
  }
}
