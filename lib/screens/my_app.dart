import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../widgets/expense_list.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Expense> _registeredExpenses = [
    Expense(
      category: Category.work,
      title: "Flutter Course",
      amount: 2500.00,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: "Shopping",
      amount: 10000.00,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("data"),
            Expanded(
              child: ExpenseList(
                expenses: _registeredExpenses,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


