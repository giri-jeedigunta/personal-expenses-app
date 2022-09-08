import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

import '../db_service.dart';
import '../models/expense.dart';
import '../widgets/text_box.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _amountController;
  late final TextEditingController _detailsController;
  late final TextEditingController _categoryController;
  late final TextEditingController _expenseDateController;

  final uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: null);
    _detailsController = TextEditingController(text: null);
    _categoryController = TextEditingController(text: null);
    _expenseDateController =
        TextEditingController(text: DateTime.now().toString());
  }

  @override
  void dispose() {
    _amountController.dispose();
    _detailsController.dispose();
    _categoryController.dispose();
    _expenseDateController.dispose();
    super.dispose();
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(18, 10, 18, 0),
              child: Text(
                'Add expense',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBox(
                    hintText: "How much did you spend?",
                    labelText: "Amount",
                    controller: _amountController,
                    onChanged: () {
                      print("amount");
                    },
                  ),
                  TextBox(
                    hintText: "What did you spend on...",
                    labelText: "Details...",
                    controller: _detailsController,
                    onChanged: () {
                      print("what");
                    },
                  ),
                  TextBox(
                    hintText:
                        "What type of expense? Eg: groceries, clothing & accessories",
                    labelText: "Category (Optional)",
                    controller: _categoryController,
                    onChanged: () {
                      print("type");
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 8, 16),
                    child: TextFormField(
                      readOnly: true,
                      controller: _expenseDateController,
                      // enabled: false,
                      onTap: () async {
                        DateTime? expenseDateController = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (expenseDateController != null) {
                          print(
                              expenseDateController); //_expenseDateController output format => 2021-03-10 00:00:00.000
                          String formattedDate = DateFormat('yyyy-MM-dd')
                              .format(expenseDateController);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            _expenseDateController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Expense data",
                        hintText: "When did you do this expense?",
                        hintStyle: const TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(222, 226, 232, 1),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            print("valid .... ");
            print(double.parse(_amountController.text));
            print(_detailsController.text);
            print(DateTime.parse(_expenseDateController.text));
            print(_categoryController.text);
            await DBService().addExpense(
              Expense(
                id: uuid.v4(),
                details: _detailsController.text,
                amount: double.parse(_amountController.text),
                category: _categoryController.text,
                expenseDate: DateTime.parse(_expenseDateController.text),
                createdOn: DateTime.now(),
              ),
            );

            _formKey.currentState?.reset();
          }
        },
        tooltip: 'Add transaction',
        child: const Icon(Icons.add),
      ),
    );
  }
}
