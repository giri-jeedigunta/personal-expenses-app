import 'package:flutter/material.dart';

class TotalSpend extends StatelessWidget {
  // DateTime dateTime = Jiffy().dateTime;

  const TotalSpend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text(
                  '10,000 kr',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 38,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 8, 0, 8),
                  child: Text(
                    'Total spend - Aug 2022',
                    style: TextStyle(
                      color: Color.fromRGBO(118, 128, 138, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // const Spacer(),
        Column(
          children: [
            Row(
              children: const [
                Text('btn'),
              ],
            ),
          ],
        )
      ],
    );
  }
}
