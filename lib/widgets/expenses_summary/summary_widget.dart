import 'package:flutter/material.dart';
import 'package:personal_expenses_app_by_gj/models/expense.dart';
import 'expenses_chart.dart';
import 'total_spend.dart';

class ExpensesSummary extends StatelessWidget {
  final List<Expense> expensesPerMonth;

  const ExpensesSummary({
    Key? key,
    required this.expensesPerMonth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 0,
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const TotalSpend(),
              ExpensesChart(expensesPerMonth: expensesPerMonth),
            ],
          )),
    );
  }
}
