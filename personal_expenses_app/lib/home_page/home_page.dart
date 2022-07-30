import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/home_page/home_page_components/daily_expense_indicator.dart';
import 'package:personal_expenses_app/home_page/home_page_components/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            /**
             * Weekly Expenses
             */
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: EdgeInsets.all(16.0),
              elevation: 8.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DailyExpenseIndicator(totalExpense: 0, dayName: "S"),
                      DailyExpenseIndicator(totalExpense: 0, dayName: "S"),
                      DailyExpenseIndicator(totalExpense: 0, dayName: "M"),
                      DailyExpenseIndicator(totalExpense: 0, dayName: "T"),
                      DailyExpenseIndicator(totalExpense: 0, dayName: "W"),
                      DailyExpenseIndicator(totalExpense: 0, dayName: "T"),
                      DailyExpenseIndicator(totalExpense: 0, dayName: "F"),
                    ]),
              ),
            ),

            /**
             * List View will show the Items that we order with its name , amount and date.
             */
            Expanded(
              child: ListView(
                children: [
                  ItemCard(
                    itemPrice: 9.99,
                    itemName: "New Shoes",
                    itemDate: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
