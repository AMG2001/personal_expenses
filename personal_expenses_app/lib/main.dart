import 'package:flutter/material.dart';
import 'package:personal_expenses_app/home_page/home_page.dart';
import 'package:personal_expenses_app/model/pages_name.dart';

void main(List<String> args) {
  runApp(PersonalExpensesApp());
}

class PersonalExpensesApp extends StatelessWidget {
  const PersonalExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        PagesName.homePageName: (context) => const HomePage(),
      },
      title: 'Personal Expenses',
      debugShowCheckedModeBanner: false,
      home:const HomePage(),
    );
  }
}
