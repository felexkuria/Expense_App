

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:multitouch_app/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({
    super.key,
   
    required this.addExpenses,
  });
 
  final Function(Expense) addExpenses;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleCOntroller = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _dateTime;
  Category _selectedCategory = Category.leisure;
  @override
  void dispose() {
    _titleCOntroller.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _addExpense(Expense expense) {}

  void _submitExpenseData() {
    final _enteredAmount = double.tryParse(_amountController.text);
    final _amountIsInvalid = _enteredAmount == null || _enteredAmount <= 0;
    if (_titleCOntroller.text.trim().isEmpty ||
        _amountIsInvalid ||
        _dateTime == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content:
              const Text("Invalid Title amount ,date and category was entered"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            )
          ],
        ),
      );
    } else {
      Expense expense = Expense(
          category: _selectedCategory,
          title: _titleCOntroller.text,
          amount: _enteredAmount,
          date: _dateTime!);
      setState(() {
        widget.addExpenses(expense);
      });
      Navigator.pop(context);
    }
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now.subtract(const Duration(days: 1000)),
      lastDate: DateTime(2050),
    );
    setState(() {
      _dateTime = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: _titleCOntroller,
            decoration: const InputDecoration(
              label: Text(
                "Title",
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "Kes",
                    label: Text(
                      "Amount",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_dateTime == null
                        ? "No Date Selected"
                        : formatter.format(_dateTime!)),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("Save Expensese"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              )
            ],
          )
        ],
      ),
    );
  }
}
