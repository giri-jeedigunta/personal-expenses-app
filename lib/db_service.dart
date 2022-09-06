import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'models/transaction.dart';

class DBService {
  var box;

  Future initDb() async {
    print("initDb ... ");
    final appDocumentsDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentsDirectory.path);
    Hive.registerAdapter(TransactionAdapter());
    box = await Hive.openBox<Transaction>('transaction');
  }

  Future addTransaction(Transaction transaction) async {
    print("addTransaction ... ");
    box = await Hive.openBox<Transaction>('transaction');
    box.put(0, transaction);
    box.put(1, transaction);
    box.put(2, transaction);
  }

  Future<List> getTransactions() async {
    var allTransactions = [];

    print("readTransactions ... ");
    box = await Hive.openBox<Transaction>('transaction');

    for (int i = 0; i < box.length; i++) {
      if (box.get(i) != null) {
        allTransactions.add(box.get(i));
      }
    }

    print("allTransactions");
    print(allTransactions);
    return allTransactions;
  }

  DBService();
}
