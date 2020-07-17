// TODO 1: Create a DrinksProvider class
// TODO 2: Extend the ChangeNotifier class
// TODO 3: Initialized the state with drinks
// TODO 4: Write a get method for the drinks
// TODO 10: Implement the selectDrink method
// TODO 12: Implement a getter function for selected Drinks

import 'package:flutter/foundation.dart';
import 'package:smtutorial/models/drink.dart';

class DrinksProvider extends ChangeNotifier {
  List<Drink> _drinks = [
    Drink("Water", false),
    Drink("Cuba Libre", false),
    Drink("Pina Colada", false),
    Drink("Havana Cola", false)
  ];

  void selectDrink(Drink drink, bool selected) {
    _drinks.firstWhere((element) => element.name == drink.name).selected =
        selected;
    notifyListeners();
  }

  List<Drink> get selectedDrinks =>
      _drinks.where((element) => element.selected).toList();

  List<Drink> get drinks => _drinks;
}
