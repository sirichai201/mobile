// ignore: file_names
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class MoneyBox extends StatelessWidget {
  String title;
  double amount;
  Color color;
  double size;
  // ignore: use_key_in_widget_constructors
  MoneyBox(this.title, this.amount, this.color, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      height: size,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Text(
            // ignore: unnecessary_string_interpolations
            '${NumberFormat("#,###.##").format(amount)}',
            style: const TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ))
        ],
      ),
    );
  }
}
