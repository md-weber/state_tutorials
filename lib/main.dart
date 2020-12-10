import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:smtutorial/cubit/checkbox_cubit_screen.dart';
import 'package:smtutorial/cubit/cubit_observer.dart';

import 'cubit/drinks_cubit.dart';

void main() {
  Bloc.observer = MainCubitObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DrinksCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cubit tutorial - Flutter Explained',
        theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
        home: CheckboxCubitScreen(),
      ),
    );
  }
}
