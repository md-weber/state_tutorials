import 'package:flutter/material.dart';
import 'package:smtutorial/riverpod/checkbox_riverpod_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod solution - Flutter Explained',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
      // TODO 8: Surround the Screen with the ProviderScope
      home: CheckboxRiverpodScreen(),
    );
  }
}
