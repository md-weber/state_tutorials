import 'package:flutter/material.dart';
import 'package:smtutorial/setState/checkbox_setState_screen.dart';

void main() {
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
      home: CheckBoxSetStateScreen(),
    );
  }
}