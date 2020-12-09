import 'package:flutter/widgets.dart';
import 'package:smtutorial/models/drink.dart';

class GetItDrinksNotifier extends ChangeNotifier {
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
