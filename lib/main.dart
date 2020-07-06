import 'package:flutter/material.dart';
import 'package:smtutorial/cubit/checkbox_cubit_screen.dart';

void main() {
  // TODO Optional 4: Initialize the Observer into Cubit.observer
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cubit tutorial - Flutter Explained',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
      // TODO 3: Use a CubitProvider and create the DrinksCubit
      home: CheckboxCubitScreen(),
    );
  }
}
