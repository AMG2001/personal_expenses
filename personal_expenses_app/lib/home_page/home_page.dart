import 'package:flutter/material.dart';
import 'package:personal_expenses_app/home_page/home_page_components/daily_expense_indicator.dart';
import 'package:personal_expenses_app/home_page/home_page_components/show_bottom_sheet.dart';
import 'package:personal_expenses_app/home_page/home_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expenses_app/home_page/home_page_state.dart';

class HomePage extends StatelessWidget {
  GlobalKey<FormState> homePageGlobalKey = GlobalKey();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemAmountController = TextEditingController();
  TextEditingController itemDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Personal Expenses'),
          ),
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
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
                            DailyExpenseIndicator(
                                totalExpense: 0, dayName: "S"),
                            DailyExpenseIndicator(
                                totalExpense: 0, dayName: "S"),
                            DailyExpenseIndicator(
                                totalExpense: 0, dayName: "M"),
                            DailyExpenseIndicator(
                                totalExpense: 0, dayName: "T"),
                            DailyExpenseIndicator(
                                totalExpense: 0, dayName: "W"),
                            DailyExpenseIndicator(
                                totalExpense: 0, dayName: "T"),
                            DailyExpenseIndicator(
                                totalExpense: 0, dayName: "F"),
                          ]),
                    ),
                  ),

                  /**
               * List View will show the Items that we order with its name , amount and date.
               */
                  Expanded(
                    child: ListView.builder(
                      itemCount: BlocProvider.of<HomePageCubit>(context)
                          .listOfItemsCard
                          .length,
                      itemBuilder: (context, index) =>
                          BlocProvider.of<HomePageCubit>(context)
                              .listOfItemsCard[index],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Item Name",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Item Amount",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: TextFormField(
                                    onTap: () {
                                      showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2022),
                                          lastDate: DateTime(2100));
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Item Date",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 24,
                                    ),
                                    FlatButton(
                                        onPressed: () {},
                                        child: Text("Add Item")),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
/**
 *  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Form(
                        key: homePageGlobalKey,
                        child: Container(
                          height: MediaQuery.of(context).size.height * .4,
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: TextFormField(
                                  key: homePageGlobalKey,
                                  controller: itemNameController,
                                  decoration: InputDecoration(
                                    labelText: "Item Name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * .8,
                              ),
                              Container(
                                child: TextFormField(
                                  // onTap: () async {
                                  //   itemDateController.text = await showDatePicker(
                                  //           context: context,
                                  //           initialDate: DateTime.now(),
                                  //           firstDate: DateTime(2022),
                                  //           lastDate: DateTime(2050))
                                  //       .toString();
                                  // },
                                  key: homePageGlobalKey,
                                  controller: itemDateController,
                                  decoration: InputDecoration(
                                    labelText: "Item Date",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * .8,
                              ),
                              Container(
                                child: TextFormField(
                                  // onTap: () async {
                                  //   itemDateController.text = await showDatePicker(
                                  //           context: context,
                                  //           initialDate: DateTime.now(),
                                  //           firstDate: DateTime(2022),
                                  //           lastDate: DateTime(2050))
                                  //       .toString();
                                  // },
                                  key: homePageGlobalKey,
                                  controller: itemDateController,
                                  decoration: InputDecoration(
                                    labelText: "Item Date",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * .8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FlatButton(
                                    onPressed: () {
                                      if (homePageGlobalKey.currentState!
                                          .validate()) {
                                        BlocProvider.of<HomePageCubit>(context)
                                            .addItemCard(
                                                itemNameController.text,
                                                DateTime.parse(
                                                    itemDateController.text),
                                                double.parse(
                                                    itemAmountController.text));
                                      }
                                    },
                                    child: Text("Add Item"),
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                 
 */