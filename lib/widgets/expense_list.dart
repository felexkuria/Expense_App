import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'expense_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.removeExpenses,
  });

  final List<Expense> expenses;
  final Function(Expense) removeExpenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error,
          ),
          onDismissed: (direction) => removeExpenses,
          key: ValueKey(
            expenses[index],
          ),
          child: ExpenseItem(
            expenses: expenses[index],
          ),
        );
      },
    );
  }
}
