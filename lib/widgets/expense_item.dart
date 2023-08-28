import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expenses,
  });

  final Expense expenses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Text(expenses.title),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(' Kes ${expenses.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children: [
                  const Icon(Icons.access_alarm),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    expenses.date.toString(),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
