import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

import '../../models/expense.dart';
import '../../models/expenses_per_week.dart';

class ExpensesChart extends StatelessWidget {
  final List<Expense> expensesPerMonth;
  const ExpensesChart({
    Key? key,
    required this.expensesPerMonth,
  }) : super(key: key);

  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';

  @override
  Widget build(BuildContext context) {
    final simpleCurrencyFormatter =
        charts.BasicNumericTickFormatterSpec.fromNumberFormat(
            NumberFormat.compactSimpleCurrency());
// locale: 'sv_se'
    final expensesData = [
      ExpensesPerWeek(
          weekLabel: '1-7', weekNumber: 2, weeklyExpensesTotal: 300.00),
      ExpensesPerWeek(
          weekLabel: '8-14', weekNumber: 3, weeklyExpensesTotal: 100),
      ExpensesPerWeek(
          weekLabel: '15-21', weekNumber: 4, weeklyExpensesTotal: 1000),
      ExpensesPerWeek(
          weekLabel: '22-31', weekNumber: 5, weeklyExpensesTotal: 2000),
    ];

    final series = [
      charts.Series(
        id: 'Clicks',
        domainFn: (ExpensesPerWeek expensesItem, _) => expensesItem.weekLabel,
        measureFn: (ExpensesPerWeek expensesItem, _) =>
            expensesItem.weeklyExpensesTotal,
        data: expensesData,
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];

    final chart = charts.BarChart(
      series,
      animate: true,
      vertical: true,
      primaryMeasureAxis: const charts.NumericAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
      ),
      secondaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: const charts.GridlineRendererSpec(
          // Tick and Label styling here.
          labelStyle: charts.TextStyleSpec(
            fontSize: 12, // size in Pts.
            color: charts.MaterialPalette.black,
          ),
        ),
        tickFormatterSpec: simpleCurrencyFormatter,
        tickProviderSpec:
            const charts.BasicNumericTickProviderSpec(desiredTickCount: 3),
      ),
      defaultRenderer: charts.BarRendererConfig(
        maxBarWidthPx: 4,
        cornerStrategy: const charts.ConstCornerStrategy(4),
      ),
    );

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
            child: SizedBox(
              height: 125,
              child: chart,
            ),
          ),
        )
      ],
    );
  }
}
