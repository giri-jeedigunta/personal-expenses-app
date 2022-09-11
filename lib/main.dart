import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'db_service.dart';
import 'constants.dart';
import 'screens/home.dart';

import 'route_generator.dart';

// final isDbInitiated = StateProvider((ref) => false);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService().initDb();
  // WidgetsFlutterBinding.ensureInitialized();
  // DBService().addTransaction(Transaction(
  //   id: "0",
  //   details: "0",
  //   amount: 99.99,
  //   expenseDate: Jiffy().dateTime,
  //   createdOn: Jiffy().dateTime,
  //   category: "testing",
  // ));
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bool isDbInitiatedCheck = ref.watch(isDbInitiated);
    // DBService().initDb(isDbInitiatedCheck);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: home,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NotoSans',
      ),
      home: const Home(),
    );
  }
}
