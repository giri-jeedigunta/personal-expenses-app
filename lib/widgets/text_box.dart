import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
    required this.title,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final Function? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 8, 16),
      child: TextField(
        onChanged: onChanged!(),
        decoration: InputDecoration(
          hintText: title,
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
    );
  }
}
