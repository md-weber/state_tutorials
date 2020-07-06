import 'package:cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:smtutorial/cubit/checkbox_cubit_screen.dart';
import 'package:smtutorial/cubit/cubit_observer.dart';
import 'package:smtutorial/cubit/drinks_cubit.dart';

void main() {
  Cubit.observer = MainCubitObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
      home: CubitProvider(
        create: (context) => DrinksCubit(),
        child: CheckboxCubitScreen(),
      ),
    );
  }
}
