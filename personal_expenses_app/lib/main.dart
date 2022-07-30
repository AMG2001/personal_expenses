import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expenses_app/home_page/home_page.dart';
import 'package:personal_expenses_app/home_page/home_page_cubit.dart';
import 'package:personal_expenses_app/home_page/home_page_state.dart';
import 'package:personal_expenses_app/model/pages_name.dart';
import 'package:bloc/bloc.dart';

void main(List<String> args) {
  runApp(PersonalExpensesApp());
}

class PersonalExpensesApp extends StatelessWidget {
  const PersonalExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child: MaterialApp(
        routes: {
          PagesName.homePageName: (context) =>  HomePage(),
        },
        title: 'Personal Expenses',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
