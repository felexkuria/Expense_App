import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'expense_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return ExpenseItem(expenses: expenses[index]);
      },
    );
  }
}
