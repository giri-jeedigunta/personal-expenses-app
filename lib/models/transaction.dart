class Transaction {
  final String id;
  final String title;
  final double amout;
  final DateTime date;
  final String? type;
  final String? tag;

  Transaction({
    required this.id,
    required this.title,
    required this.amout,
    required this.date,
    this.type,
    this.tag,
  });
}
