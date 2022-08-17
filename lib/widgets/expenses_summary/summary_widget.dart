import 'package:flutter/material.dart';
import 'expenses_chart.dart';
import 'total_spend.dart';

class ExpensesSummary extends StatelessWidget {
  const ExpensesSummary({
    Key? key,
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
            children: const [
              TotalSpend(),
              ExpensesChart(),
            ],
          )),
    );
  }
}
