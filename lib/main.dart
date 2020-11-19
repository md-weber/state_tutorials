import 'package:flutter/material.dart';
import 'package:smtutorial/redux/redux_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // TODO 8: Create a store and initialize the state

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Redux solution - Flutter Explained',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
      // TODO 9: Surround the ReduxScreen with a StoreProvider Widget
      home: ReduxScreen(),
    );
  }
}
