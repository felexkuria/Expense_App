import 'package:flutter/material.dart';
import 'package:multitouch_app/widgets/chart/chart.dart';
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
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(
          addExpenses: onAddExpenses,
        );
      },
    );
  }

  void onAddExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          "Expense Deleted",
        ),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        "No expenses Found Start Adding Some!!",
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registeredExpenses,
        removeExpenses: _removeExpense,
      );
    } else {
      const Center(
        child: Text(
          "No expenses Found Start Adding Some!!",
        ),
      );
    }

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
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
