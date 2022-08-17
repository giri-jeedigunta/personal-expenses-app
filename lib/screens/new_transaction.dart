import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  const NewTransaction({Key? key}) : super(key: key);
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
          child: Text('NewTransaction'),
        ),
      ),
    );
  }
}
