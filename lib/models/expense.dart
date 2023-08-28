final uuid = Uuid();

class Expense {
  final String title;
  final double amount;
  final String id;
  final DateTime date;
  Expense({
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();
}
