// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';

import 'package:flutter_application_7/main.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites Page'),
        backgroundColor: Colors.green,
      ),
      drawer: Navigator(),
    );
  }
}
