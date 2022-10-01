import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:personal_expenses_app_by_gj/db_service.dart';
import '../constants.dart';

import '../widgets/expenses_summary/summary_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var expensesPerMonth;

  @override
  void initState() {
    super.initState();
    final data = DBService().getExpenses(Jiffy().MMM, false);

    setState(() {
      expensesPerMonth = data;
    });
  }

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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  db,
                  arguments: 'Data from home',
                );
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Container(
        color: const Color.fromRGBO(247, 247, 246, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
                future: expensesPerMonth,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData && snapshot.data.length > 0) {
                    print("if ......");
                    return ExpensesSummary(
                      expensesPerMonth: snapshot.data,
                    );
                  } else if (snapshot.hasError) {
                    print("if else ......");
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    print("else ......");
                    return Column(children: const <Widget>[
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      ),
                    ]);
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            addExpense,
            arguments: 'Data from home',
          );
        },
        tooltip: 'Add transaction',
        child: const Icon(Icons.add),
      ),
    );
  }
}
