import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 1)
class Expense {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String details;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final DateTime expenseDate;

  @HiveField(4)
  final DateTime createdOn;

  @HiveField(5)
  final String? category;

  @HiveField(6)
  final String month;

  @HiveField(7)
  final int weekNo;

  Expense({
    required this.id,
    required this.details,
    required this.amount,
    required this.expenseDate,
    required this.createdOn,
    this.category,
    required this.month,
    required this.weekNo,
  });
}
