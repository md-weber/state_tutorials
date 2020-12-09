import 'package:flutter/material.dart';
import 'package:smtutorial/get_it_mixins/get_it_mixin_screen.dart';

void main() {
  // TODO 5: call the setup method
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get It Mixins Tutorial - Flutter Explained',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
      home: GetItMixinScreen(),
    );
  }
}
