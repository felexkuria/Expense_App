import 'package:flutter/material.dart';
import 'package:multitouch_app/widgets/new_expense.dart';

import '../models/expense.dart';
import '../widgets/expense_list.dart';

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key});

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
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

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return const NewExpense();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpensesOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Expense "),
          Expanded(
            child: ExpenseList(
              expenses: _registeredExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
