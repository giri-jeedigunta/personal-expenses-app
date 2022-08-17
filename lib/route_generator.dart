import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/new_transaction.dart';
import 'screens/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case newTRansactionRoute:
        return MaterialPageRoute(
          builder: (_) => const NewTransaction(),
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
