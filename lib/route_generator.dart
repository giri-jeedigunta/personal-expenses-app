import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/db_view.dart';
import 'screens/add_expense.dart';
import 'screens/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case addExpense:
        return MaterialPageRoute(
          builder: (_) => const NewTransaction(),
        );
      case db:
        return MaterialPageRoute(
          builder: (_) => const DB(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
