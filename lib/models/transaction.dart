class Transaction {
  final String id;
  final String title;
  final double amout;
  final DateTime transactionDate;
  final DateTime createdOn;
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
