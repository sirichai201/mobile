import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MyApp',
        home: MyHomePage(),
        theme: ThemeData(primarySwatch: Colors.green));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โปรแกรมนับเลข'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('กดปุ่มเพื่อเพิ่มจำนวนตัวเลข', style: TextStyle(fontSize: 24)),
          Text(
            number.toString(),
            style: const TextStyle(fontSize: 60),
          ),
          TextButton(
            onPressed: () {},
            child: Text('TextButton'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              fixedSize: Size(210, 40),
              textStyle: TextStyle(fontSize: 30),
              backgroundColor: Colors.green,
            ),
          ),
          SizedBox(height: 20), // เพิ่มตัวแปรระหว่างปุ่ม
          ElevatedButton(
            onPressed: () {},
            child: Text('ELevatedButton'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.red,
              backgroundColor: Colors.yellow,
              fixedSize: Size(210, 40),
              textStyle: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20), // เพิ่มตัวแปรระหว่างปุ่ม
          OutlinedButton(
            onPressed: () {},
            child: Text('OutlineButton'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              fixedSize: Size(210, 40),
              textStyle: TextStyle(fontSize: 20),
              side: BorderSide(color: Colors.grey),
            ),
          ),

          TextFormField(
            decoration: new InputDecoration(labelText: 'ชื่อรายการ'),
            autofocus: true,
          ),
          TextFormField(
            decoration: new InputDecoration(labelText: 'จำนวนเงิน'),
            keyboardType: TextInputType.number,
          ),
          // Expanded(
          //child: ListView(
          //children: getData(10),
          // )),
          Expanded(child: ListView.builder(itemBuilder: ((context, i) {
            return ListTile(
                title: Text('เมนูที่ ${i + 1}', style: TextStyle(fontSize: 25)),
                subtitle: Text('หัวข้อย่อยที่ ${i + 1}'));
          }))),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            number++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> getData(int count) {
    List<Widget> data = [];
    for (var i = 0; i < count; i++) {
      var menu = ListTile(
          title: Text('เมนูที่ ${i + 1}', style: TextStyle(fontSize: 25)),
          subtitle: Text('หัวข้อย่อยที่ ${i + 1}'));
      data.add(menu);
    }
    return data;
  }
}
