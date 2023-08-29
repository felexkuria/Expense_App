import 'package:flutter/material.dart';
import 'package:multitouch_app/screens/expense_app.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const ExpenseApp()));
}
