import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expenses_app/home_page/home_page_cubit.dart';

void showHomePageBottomSheet(
    BuildContext context,
    GlobalKey<FormState> homePageGlobalKey,
    TextEditingController itemNameController,
    TextEditingController itemAmountController,
    TextEditingController itemDateController) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: homePageGlobalKey,
              child: Container(
                height: MediaQuery.of(context).size.height * .4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                        controller: itemAmountController,
                        key: homePageGlobalKey,
                        decoration: InputDecoration(
                          labelText: "Item Amount",
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          onPressed: () {
                            if (homePageGlobalKey.currentState!.validate()) {
                              BlocProvider.of<HomePageCubit>(context)
                                  .addItemCard(
                                      itemNameController.text,
                                      DateTime.parse(itemDateController.text),
                                      double.parse(itemAmountController.text));
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
          ),
        );
      });
}
