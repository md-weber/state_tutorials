import 'package:cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:smtutorial/setState/checkbox_setState_screen.dart';

import 'cubit/cubit_observer.dart';

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
      title: 'Cubit tutorial - Flutter Explained',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
      // TODO: Set to your preferred solution
      home: CheckBoxSetStateScreen(),
    );
  }
}
