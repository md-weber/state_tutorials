import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/redux/app_state.dart';
import 'package:smtutorial/redux/reducer.dart';
import 'package:redux/redux.dart';
import 'package:smtutorial/redux/redux_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store<AppState> _store = Store<AppState>(
    updateDrinksReducer,
    initialState: AppState(
      drinks: [
        Drink("Water", false),
        Drink("Cuba Libre", false),
        Drink("Pina Colada", false),
        Drink("Havana Cola", false)
      ],
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Redux solution - Flutter Explained',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
      home: StoreProvider<AppState>(
        store: _store,
        child: ReduxScreen(),
      ),
    );
  }
}
