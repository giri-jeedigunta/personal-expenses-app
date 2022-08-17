import 'package:flutter/material.dart';
import 'package:personal_expenses_app_by_gj/constants.dart';

import '../widgets/expenses_summary/summary_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        backgroundColor: const Color.fromRGBO(247, 247, 246, 1),
        elevation: 0,
        title: const Text(
          'Welcome, Giri',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 10, 0),
          child: CircleAvatar(
            backgroundColor: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: const Color.fromRGBO(247, 247, 246, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            ExpensesSummary(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            newTRansactionRoute,
            arguments: 'Data from home',
          );
        },
        tooltip: 'Add transaction',
        child: const Icon(Icons.add),
      ),
    );
  }
}
