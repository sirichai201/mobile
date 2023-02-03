import 'package:flutter/material.dart';
import 'package:flutter_application__4_1_2/CafeMenu.dart';

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
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Home Page'),
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
  List<CafeMenu> menu = [
    CafeMenu("Americano", 50, "assets/images/menu1.jpg"),
    CafeMenu("Cappuccino", 60, "assets/images/menu2.jpg"),
    CafeMenu("Latte", 65, "assets/images/menu3.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกเมนูเครื่องดื่ม'),
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, index) {
          CafeMenu drink = menu[index];
          return ListTile(
            leading: Image.asset(drink.img),
            title: Text(drink.name, style: TextStyle(fontSize: 30)),
            subtitle: Text('ราคา' + drink.price.toString() + 'บาท',
                style: TextStyle(fontSize: 24)),
          );
        },
      ),
    );
  }
}
