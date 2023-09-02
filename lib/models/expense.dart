import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateFormat = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff_sharp,
  Category.leisure: Icons.movie_creation,
  Category.work: Icons.work,
};

class Expense {
  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category;
  Expense({
    required this.category,
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();

  String get formattedDate {
    return dateFormat.format(date);
  }
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
  ExpenseBucket({required this.category, required this.expenses});

  double get totalExpense {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
