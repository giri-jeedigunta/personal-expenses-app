import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'models/expense.dart';

class DBService {
  var box;

  final uuid = const Uuid();

  Future initDb() async {
    print("initDb ... ");
    final appDocumentsDirectory = await getApplicationDocumentsDirectory();
    var hiveDbPath =
        Directory('${appDocumentsDirectory.path}/PersonalExpensesAppData');
    // hiveDbPath.delete(recursive: true);
    await Hive.initFlutter('PersonalExpensesAppData');
    Hive.registerAdapter(ExpenseAdapter());
    box = await Hive.openBox<Expense>('Expenses');
  }

  Future addExpense(Expense expenseDetails) async {
    print("Add Expense op ... ");
    box = await Hive.openBox<Expense>('Expenses');
    box.put(uuid.v4(), expenseDetails);
  }

  Future<List> getExpenses(String month, bool shouldSendFullList) async {
    final List<Expense> allExpenses = [];

    print("read Expenses ... ");
    box = await Hive.openBox<Expense>('Expenses');

    if (shouldSendFullList) {
      for (var k in box.keys) {
        if (box.get(k) != null) {
          allExpenses.add(box.get(k));
        }
      }
    } else {
      for (var k in box.keys) {
        if (box.get(k) != null && box.get(k).month == month) {
          allExpenses.add(box.get(k));
        }
      }
    }

    allExpenses.sort((p1, p2) {
      return Comparable.compare(p1.expenseDate, p2.expenseDate);
    });
    return allExpenses;
  }

  DBService();
}
