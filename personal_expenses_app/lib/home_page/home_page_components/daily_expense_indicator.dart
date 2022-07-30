import 'package:flutter/material.dart';

class DailyExpenseIndicator extends StatelessWidget {
  DailyExpenseIndicator({required this.totalExpense, required this.dayName});
  int totalExpense = 0;
  String dayName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("\$${totalExpense}"),
        SizedBox(
          height: 8,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .05,
          color: Colors.grey,
          width: MediaQuery.of(context).size.width * .005,
        ),
        SizedBox(
          height: 8,
        ),
        Text(dayName)
      ],
    );
  }
}
