import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../db_service.dart';
import '../models/transaction.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  @override
  Widget build(BuildContext context) {
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
          child: const Center(
            child: Text('New Trnsaction'),
          )),
    );
  }
}
