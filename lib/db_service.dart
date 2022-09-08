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
    await Hive.initFlutter(appDocumentsDirectory.path);
    Hive.registerAdapter(ExpenseAdapter());
    box = await Hive.openBox<Expense>('Expenses');
  }

  Future addExpense(Expense expenseDetails) async {
    print("Add Expense op ... ");
    box = await Hive.openBox<Expense>('Expenses');
    box.put(uuid.v4(), expenseDetails);
  }

  Future<List> getExpenses() async {
    var allExpenses = [];

    print("read Expenses ... ");
    box = await Hive.openBox<Expense>('Expenses');

    for (var k in box.keys) {
      if (box.get(k) != null) {
        allExpenses.add(box.get(k));
      }
    }

    return allExpenses;
  }

  DBService();
}
