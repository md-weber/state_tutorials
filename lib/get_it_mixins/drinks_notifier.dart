import 'package:flutter/widgets.dart';
import 'package:smtutorial/models/drink.dart';

// TODO 2: Create a GetItDrinksNotifier extends ChangeNotifier

class GetItDrinksNotifier extends ChangeNotifier {
  List<Drink> _drinks = [
    Drink("Water", false),
    Drink("Cuba Libre", false),
    Drink("Pina Colada", false),
    Drink("Havana Cola", false)
  ];

  List<Drink> get selectedDrinks =>
      _drinks.where((element) => element.selected).toList();

  List<Drink> get drinks => _drinks;
}
