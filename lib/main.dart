import 'package:flutter/material.dart';
import 'package:smtutorial/get_it_mixins/get_it_mixins_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetIt Mixins solution - Flutter Explained',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
      home: GetItMixinsScreen(),
    );
  }
}
