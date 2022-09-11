import 'package:flutter/material.dart';
import '../db_service.dart';
import 'package:intl/intl.dart';

class DB extends StatefulWidget {
  const DB({Key? key}) : super(key: key);

  @override
  State<DB> createState() => _DBState();
}

class _DBState extends State<DB> {
  var data;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    // DBService().addExpenses(
    //   Transaction(
    //     id: "0",
    //     details: "blah...",
    //     amount: 99,
    //     expenseDate: Jiffy().dateTime,
    //     createdOn: Jiffy().dateTime,
    //   ),
    // );

    var list = DBService().getExpenses();
    setState(() {
      data = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Future<dynamic> list = DBService().getExpenses();

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
      body: Container(
        color: const Color.fromRGBO(247, 247, 246, 1),
        child: FutureBuilder(
          future: list, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var transaction = snapshot.data[index];
                      String created =
                          DateFormat.yMMMEd().format(transaction.createdOn);
                      String transactionRecorded =
                          DateFormat.yMMMEd().format(transaction.expenseDate);

                      return SizedBox(
                        child: Text(
                          '${transaction.details} ${transaction.amount} $transactionRecorded $created',
                        ),
                      );
                    })
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
      ),
    );
  }
}
