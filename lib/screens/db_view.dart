import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../db_service.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';

class DB extends StatefulWidget {
  const DB({Key? key}) : super(key: key);

  @override
  State<DB> createState() => _DBState();
}

class _DBState extends State<DB> {
  var data;

  @override
  initState() {
    super.initState();
    for (var i = 0; i < 45; i++) {
      var newExpenseDate = Jiffy().dateTime;
      var newExpenseDateUpdated = Jiffy(newExpenseDate).add(days: i);
      var wkno = Jiffy(newExpenseDateUpdated).week;
      var month = Jiffy(newExpenseDateUpdated).MMM;
      var amount = 100.00 * i;
      DBService().addExpense(
        Expense(
          id: i.toString(),
          details: "item + $i",
          amount: amount,
          expenseDate: newExpenseDateUpdated.dateTime,
          createdOn: Jiffy().dateTime,
          month: month,
          weekNo: wkno,
        ),
      );
    }

    var list = DBService().getExpenses(Jiffy().MMM, true);
    setState(() {
      data = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final Future<dynamic> list = DBService().getExpenses(Jiffy().MMM, true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        backgroundColor: const Color.fromRGBO(247, 247, 246, 1),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 10, 0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: FutureBuilder(
        future: data, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var transaction = snapshot.data[index];
                      return SizedBox(
                        child: Text(
                          '${transaction.expenseDate} ${transaction.weekNo}',
                        ),
                      );
                    }),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Column(
            children: children,
          );
        },
      ),
    );
  }
}
