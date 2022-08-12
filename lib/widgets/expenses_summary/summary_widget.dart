import 'package:flutter/material.dart';
import 'package:personal_expenses_app_by_gj/widgets/expenses_summary/expenses_chart.dart';
import 'package:personal_expenses_app_by_gj/widgets/expenses_summary/total_spend.dart';

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
