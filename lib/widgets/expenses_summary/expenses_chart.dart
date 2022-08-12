import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ExpensesChart extends StatelessWidget {
  const ExpensesChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expensesData = [
      ExpensesPerWeek('1-7', 1, 300.00),
      ExpensesPerWeek('8-14', 2, 300.00),
      ExpensesPerWeek('15-21', 3, 600.00),
      ExpensesPerWeek('22-28', 4, 100.00),
      ExpensesPerWeek('29-31', 5, 200.00),
    ];

    final series = [
      charts.Series(
        id: 'Clicks',
        domainFn: (ExpensesPerWeek expensesItem, _) => expensesItem.weekLabel,
        measureFn: (ExpensesPerWeek expensesItem, _) =>
            expensesItem.weeklyExpensesTotal,
        data: expensesData,
      ),
    ];

    final chart = charts.BarChart(
      series,
      animate: true,
      vertical: true,
      defaultRenderer: charts.BarRendererConfig(
        maxBarWidthPx: 8,
        cornerStrategy: const charts.ConstCornerStrategy(8),
      ),
    );

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 125,
            child: chart,
          ),
        )
      ],
    );
  }
}

class ExpensesPerWeek {
  final String weekLabel;
  final int weekNumber;
  final double weeklyExpensesTotal;

  ExpensesPerWeek(this.weekLabel, this.weekNumber, this.weeklyExpensesTotal);
}
