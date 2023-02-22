import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/favorites_page.dart';
import 'package:flutter_application_7/screens/form_screen.dart';

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
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'แอปรายจ่าย'),
      debugShowCheckedModeBanner: false,
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormScreen();
                }));
              },
              icon: Icon(Icons.add))
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepOrange,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, int index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: FittedBox(
                  child: Text('500'),
                ),
              ),
              title: Text('รายการ'),
              subtitle: Text('วัน/เดือน/ปี'),
            ),
          );
        },
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.black38,
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 52,
              backgroundImage: NetworkImage('src/classroom1'),
            ),
            SizedBox(height: 12),
            Text('sirichai',
                style: TextStyle(fontSize: 28, color: Colors.black)),
            Text('Sirichaia@Dev.com',
                style: TextStyle(fontSize: 28, color: Colors.white)),
          ],
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'Home Page')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text('Favourites'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FavouritesPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.workspaces_outline),
            title: const Text('Workflow'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text('Updates'),
            onTap: () {},
          ),
          const Divider(color: Colors.black54),
          ListTile(
            leading: const Icon(Icons.account_tree_outlined),
            title: const Text('Plugins'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notifications'),
            onTap: () {},
          ),
        ],
      ));
}
