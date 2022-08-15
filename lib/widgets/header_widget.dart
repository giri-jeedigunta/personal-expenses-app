import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String? firstName;
  const Header({Key? key, this.firstName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 0.0,
      backgroundColor: const Color.fromRGBO(247, 247, 246, 1),
      elevation: 0,
      title: Text(
        'Welcome, $firstName',
        textAlign: TextAlign.left,
        style: const TextStyle(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
