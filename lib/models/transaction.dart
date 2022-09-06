import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 1)
class Transaction {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double amout;

  @HiveField(3)
  final DateTime transactionDate;

  @HiveField(4)
  final DateTime createdOn;

  @HiveField(5)
  final String? category;

  Transaction({
    required this.id,
    required this.title,
    required this.amout,
    required this.transactionDate,
    required this.createdOn,
    this.category,
  });
}
